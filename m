Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5843E4B9;
	Tue, 21 Jul 2026 22:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672131; cv=none; b=rxvkG0fZO5PgXTLVqSrwlecteH+hG5VG8kUk7ZcbHoKwZQkWZa27G7BmWpKKTeDMBOHmiSeSFZ5ZQSgLf92gMobdA7TV794R7AhpEQLdVd7hy+4lwFYxjC/0VD9LE/95D4riBE1hZXl+G0FyOMUMcpCgCRk18uEwnF3ptoa0Jos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672131; c=relaxed/simple;
	bh=K0hYKZ3Y14GkBhkj2aO35MAFJ9SJd3dMoEfcSlNSvW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8TdwL5z1H+rTGSv91Znx5HZqmentaWo8zesCehIZep+X8q59+N8wBLFH9FKSCGHcEM4EhaLoZMYF29gMtZw7UOWuPblYP6gukuJQ3RSpu/79rb5rYXKVtfwWlKKrcMcEBYxN0Ac/Av6NCL9UIx83s1Z7sqX9c0GP9YK1d1VYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRgqJDm5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRgqJDm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55161F00A3E;
	Tue, 21 Jul 2026 22:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784672129;
	bh=0Dsg/DJLGZllOai+LIwtpPFxkuXZu072GPBgBB+B/5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SRgqJDm5hj1SKfqHYa/fX21nuLq/8HS735jhgUyc6UT6tKSbeYu1SGYriZS6410kV
	 rMLCovZk1IAU66ghxOCY8DiFJgASV6KYnigiu1uJbBwpIr29vypV3xnU5NG0gAzpkD
	 312dWR1WGF7TEgSpUOCLSQnBsOW/TezHTEJDSlPZzMJ3/Wh1CRm6aKMlwg5VTzIekY
	 Gxm04cQ8plSTMGXopTKG3cqA1eflutJ5Z2jrlBbNg8MyA8CedClvA2fmod5wGuGH7o
	 Rx4L67PyH4p74Tjc7NqN7QlSn8Wbi3aH8ejOsbhi72Y/uliiv4rTFl4Et4/7BJZXbO
	 ApnYc7mxv4GqQ==
Message-ID: <e6983266-da39-4f75-b11c-d4b79cea27a3@kernel.org>
Date: Tue, 21 Jul 2026 23:15:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <54G6QklSf6TM84GOR9hmCKOLJ_kQuzVolJUAJr8Su3aMmp5xV8Dfe0XZit4C40O5QbDM3UpW9zB9K17ApAbqVQ==@protonmail.internalid>
 <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/07/2026 14:41, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c       |   2 +
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 146 ++++++++++++++++++---
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>   7 files changed, 147 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 52bf56e517f9..6dbe18be5b49 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -6,6 +6,7 @@
>   #include <linux/pm_runtime.h>
> 
>   #include "iris_core.h"
> +#include "iris_ctrls.h"
>   #include "iris_firmware.h"
>   #include "iris_state.h"
>   #include "iris_vpu_common.h"
> @@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
>   		goto error_unload_fw;
> 
>   	core->iris_firmware_data->init_hfi_ops(core);
> +	iris_session_init_caps(core);
> 
>   	ret = iris_hfi_core_init(core);
>   	if (ret)
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d758..a3aa41aa1e66 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,20 +16,138 @@
> 
>   #define MAX_FIRMWARE_NAME_SIZE	128
> 
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	static const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	static const char *vfw = "vfw";
> +	const size_t vfwlen = strlen(vfw);
> +	static const char *vf = "video-firmware.";
> +	const size_t vflen = strlen(vf);
> +
> +	for (size_t i = 0; i + mlen < size; i++) {
> +		const char *found;
> +
> +		if (memcmp(data + i, marker, mlen))
> +			continue;
> +
> +		found = data + i + mlen;
> +		size -= i + mlen;
> +
> +		/* vfw => Gen2 */
> +		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> +			return true;
> +
> +		if (size < vflen ||
> +		    memcmp(found, vf, vflen))
> +			return false;
> +
> +		found += vflen;
> +		size -= vflen;
> +
> +		/*
> +		 * video-firmware.1.x is Gen1.
> +		 * video-firmware.2.x and video-firmware.10.x are Gen2.
> +		 */
> +		return size >= 2 &&
> +			(*found >= '2' || (*found == '1' && found[1] != '.'));
> +	}
> +
> +	return false;

The logic here is much easier to read for me thanks for updating it.

> +}
> +
> +static const struct firmware *iris_detect_firmware(struct iris_core *core,
> +						   const char **fw_name)
> +{
> +	const struct iris_firmware_desc *desc;
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name = NULL;
> +	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> +
> +	/*
> +	 * A platform may support both Gen1 and Gen2 firmware; which one is used
> +	 * depends on the firmware image installed on the system, not on the
> +	 * hardware. That installed image does not change while the device is
> +	 * bound, so detect the generation only once and reuse the chosen
> +	 * descriptor on later core bring-ups (e.g. after a system error
> +	 * recovery). Besides avoiding the redundant probing, this ensures
> +	 * core->iris_firmware_desc and iris_firmware_data are published exactly
> +	 * once, before any session exists, so the lockless readers in the ioctl
> +	 * paths never observe a reassignment.
> +	 */
> +	if (core->iris_firmware_desc) {
> +		if (ret)
> +			*fw_name = core->iris_firmware_desc->fwname;
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		return ret ? ERR_PTR(ret) : firmware;
> +	}
> +
> +	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		desc = core->iris_platform_data->firmware_desc_gen2;
> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	if (ret) {
> +		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
> +		*fw_name = desc->fwname;
> +		if (has_both_gens)
> +			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
> +		else
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name = desc->fwname;
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else {
> +		/* firmware-name given: load it and detect its generation. */
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		if (has_both_gens &&
> +		    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {

Is it really legitimate to parse the _entire_ firmware for this data - 
potentially megabytes ?

Surely the first 4k or less of data is enough to know if a firmware 
string has been detected ?

> +			dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +		}
> +	}
> +
> +	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
> +	core->iris_firmware_data = desc->firmware_data;
> +	core->iris_firmware_desc = desc;
> +
> +	return firmware;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core)
>   {
>   	const struct firmware *firmware = NULL;
>   	struct device *dev = core->dev;
>   	struct resource res;
>   	phys_addr_t mem_phys;
> +	const char *fw_name;
>   	size_t res_size;
>   	ssize_t fw_size;
>   	void *mem_virt;
>   	int ret;
> 
> -	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> -		return -EINVAL;
> -
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>   	if (ret)
>   		return ret;
> @@ -37,9 +155,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   	mem_phys = res.start;
>   	res_size = resource_size(&res);
> 
> -	ret = request_firmware(&firmware, fw_name, dev);
> -	if (ret)
> -		return ret;
> +	firmware = iris_detect_firmware(core, &fw_name);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
> 
>   	fw_size = qcom_mdt_get_size(firmware);
>   	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -66,18 +184,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   int iris_fw_load(struct iris_core *core)
>   {
>   	const struct tz_cp_config *cp_config;
> -	const char *fwpath = NULL;
>   	int i, ret;
> 
> -	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> -					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_firmware_desc->fwname;
> -
> -	ret = iris_load_fw_to_memory(core, fwpath);
> +	ret = iris_load_fw_to_memory(core);
>   	if (ret) {
> -		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		dev_err(core->dev, "firmware download failed %d\n", ret);
> +		return ret;
>   	}
> 
>   	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -99,7 +211,7 @@ int iris_fw_load(struct iris_core *core)
>   		}
>   	}
> 
> -	return ret;
> +	return 0;
>   }
> 
>   int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..55a4fa356985 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -289,11 +289,7 @@ struct iris_firmware_desc {
>   };
> 
>   struct iris_platform_data {
> -	/*
> -	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> -	 * supporting both firmware kinds.
> -	 */
> -	const struct iris_firmware_desc *firmware_desc;
> +	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
> 
>   	const struct vpu_ops *vpu_ops;
>   	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 6e06a32822bb..961dce2e6aa9 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>   	.fwname = "qcom/vpu/vpu20_p1.mbn",
>   };
> 
> +static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +};
> +
>   static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>   	.firmware_data = &iris_hfi_gen1_data,
>   	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
>   };
> 
>   const struct iris_platform_data sc7280_data = {
> -	.firmware_desc = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
>   };
> 
>   const struct iris_platform_data sm8250_data = {
> -	.firmware_desc = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 2c63adbc5579..74626b35d9cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>    * - inst_caps to platform_inst_cap_qcs8300
>    */
>   const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
>   };
> 
>   const struct iris_platform_data sm8550_data = {
> -	.firmware_desc = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
>    * - controller_rst_tbl to sm8650_controller_reset_table
>    */
>   const struct iris_platform_data sm8650_data = {
> -	.firmware_desc = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu33_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
>   };
> 
>   const struct iris_platform_data sm8750_data = {
> -	.firmware_desc = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu35_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
>    * - different num_vpp_pipe
>    */
>   const struct iris_platform_data x1p42100_data = {
> -	.firmware_desc = &iris_vpu30_p1_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index c2dcb50a2782..7fe31136df21 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
>   		return core->irq;
> 
>   	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
> 
>   	core->ubwc_cfg = qcom_ubwc_config_get_data();
>   	if (IS_ERR(core->ubwc_cfg))
> @@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
> 
> -	iris_session_init_caps(core);
> -
>   	ret = v4l2_device_register(dev, &core->v4l2_dev);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9b..33edbc5cab8f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-dma-contig.h>
> 
> +#include "iris_ctrls.h"
>   #include "iris_vidc.h"
>   #include "iris_instance.h"
>   #include "iris_vdec.h"
> 
> --
> 2.47.3
> 
> 

