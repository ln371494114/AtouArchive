
project_name="GundamSales"

scheme_name="GundamSales"

ipa_name="GundamSales"
# 工程中Target对应的配置plist文件名称, Xcode默认的配置文件为Info.plist
info_plist_name="Info"
# 指定要打包编译的方式 : Release,Debug，或者自定义的编译方式
build_configuration="Debug"
#firToken
fir_token="7d6006a677745f4646c81cfe20fe6720"
# 指定输出ipa路径
export_path="/Users/linan/Desktop/Archive/$scheme_name-IPA"
# 指定输出归档文件地址
export_archive_path="$export_path/$scheme_name.xcarchive"
# 指定输出ipa地址
export_ipa_path="$export_path"
# 指定plist地址
ExportOptionsPlistPath="/Users/linan/Desktop/Gundam_iOS/GundamSales/ExportOptions.plist"


# 删除旧.xcarchive文件
rm -rf /Users/linan/Desktop/Gundam_iOS/GundamSales/Archive

xcodebuild clean -workspace ${project_name}.xcworkspace -scheme ${scheme_name} 
-configuration ${build_configuration}

xcodebuild archive -workspace ${project_name}.xcworkspace -scheme ${scheme_name} -configuration ${build_configuration} -archivePath ${export_archive_path}

xcodebuild  -exportArchive -archivePath ${export_archive_path} -exportPath ${export_ipa_path} -exportOptionsPlist ${ExportOptionsPlistPath} -allowProvisioningUpdates

fir publish "$export_ipa_path/$ipa_name.ipa" -T ${fir_token}

