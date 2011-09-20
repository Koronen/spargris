namespace :spargris do
  desc "Merge multiple vendors into one"
  task :merge_vendors => :environment do
    vendor_ids = ARGV[1..ARGV.length-1].map(&:to_i)
    vendor_id = vendor_ids.shift
    vendors = Vendor.find_all_by_id(vendor_ids).sort_by(&:name)

    vendors.each do |v|
      puts "Found ##{v.id}: #{v.name}"
    end

    vendor = Vendor.find_by_id(vendor_id)
    puts "Merging into ##{vendor.id}: #{vendor.name}"

    transactions = Transaction.find_all_by_vendor_id(vendors.map(&:id))
    transactions.each do |t|
      puts "Updating transaction ##{t.id}"
      t.update_attribute(:vendor_id, vendor.id)
    end

    vendors.each do |v|
      puts "Destroying vendor ##{v.id} #{v.name}"
      v.destroy
    end
  end
end
