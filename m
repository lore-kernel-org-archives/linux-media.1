Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE173EB112;
	Tue,  4 Aug 2026 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868059; cv=none; b=E7irh1tV5sG7/UvbWwETaxkFNk4y3yvbmCdcxvu7bhW6iFtdquaROnmSof2uhSlE1ni3PjCK3euLyfqFsUGjdWCAUQBoiq0NA42Dy7eg3urQb1Gg0g+Gmv+KCaFo5bFjp/Va+sukUDeAzR4bmd5mgaYKuZ2Qq7Q8weaQ7EdPrMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868059; c=relaxed/simple;
	bh=+nx0m30jvJNLR+AVrWZqkStFCFrEd/LxWlDlNr663aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnCdREXY9qMoYsILC8qvjjiWcpn9rEE7zyOtKXXvptujjk9zVeDeLwkDhzX7Oz70yLlyKzu85nkSd9jWtWNztla+lDPCmEWJzNxL+UJjEYHOfX+16erADXNpGyxhkRLKwFKhp7QZEzwOkzhTtfUwNFxfZMLGhDQe+n2NUglCgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gLzyDobi; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/Z4jYYRh; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gLzyDobi";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/Z4jYYRh"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1785868024; bh=YrMMNGosshER4iLXgDtpRWx
	BdjnbgQ6m/RcBo2d3aCo=; b=gLzyDobiekLYeul74NVwZIeqq+9U9cogl97CCXaDsOFMhbjipB
	A/64P6yRvr2mCa/UZkATDS/PFdFrCGe3WHpfiRZpXGK3yFrfeGdQg/mXXGPP7C8IemM8+Q2KVkC
	SqKQ3rcTtFZUODWBw1AJ/rNDIo/4jF4mEWr19aXRE+qT/gUgpOMfmAT9XbPHmoKw9lpR4rqMnlx
	JmPIOwHHUdE2Rrjh0axObrnQDenhMrYOyeGAyBDLSggED0qKSicVMBXY3+qxK7PXrOykHqpaJHt
	Tcy9jrelq1HZfVgqzMsW+9kb7DaX3hBQRRcPLybn5+KW5jjjhcmDNaPr1tmsmXT8g6Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1785868024; bh=YrMMNGosshER4iLXgDtpRWx
	BdjnbgQ6m/RcBo2d3aCo=; b=/Z4jYYRh+7g2lZVXvXMut/rg4c/2TvcRvWAziqmMZ/2Jwvq1mG
	G1IS8tRg7q5DQvk59l0BUGgjA+5MyfdaNvDg==;
Message-ID: <f7cae569-0c51-41fe-92ab-f29311a22761@mainlining.org>
Date: Tue, 4 Aug 2026 21:27:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Daniel Scally <dan.scally@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
 <anGlY_kwp_I-fRnz@kekkonen.localdomain>
Content-Language: en-US
From: Danila Tikhonov <danila@mainlining.org>
In-Reply-To: <anGlY_kwp_I-fRnz@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thank you for your comment.

On 04/08/2026 11:40, Sakari Ailus wrote:
> Hi Danila,
>
> Thank you for the patch.
>
> On Sat, Aug 01, 2026 at 09:04:15PM +0300, Danila Tikhonov wrote:
>> The DW9800W uses the same chip ID and register layout as the DW9800K,
>> but requires different default VCM frequency value.
> Is this a real difference between the two models or what fits for the
> attached lens? Too bad the datasheet isn't publicly available. :-(
>
> At least the differing default and constraints for dongwoon,vcm-prescale
> needs to be documented in bindings.
I share your skepticism and have essentially the same concerns. Since I
do not have the DW9800K datasheet, I cannot say with certainty how it
differs from the DW9800W.

In particular, the parameter referred to as the VCM frequency in the
driver is used to derive the SACT value. For the DW9800W, SACT[5:0]
defines the actuator resonance period in SAC mode and the one-step
period in LSC mode. The datasheet gives the corresponding formulas as:
- tVIB = 6.3 ms + SACT * 0.1 ms
- LSC 1-step period = 252 µs + SACT * 4 µs

Therefore, the default value may differ between the DW9800K and DW9800W
if the formulas or timing characteristics used to calculate SACT are
different.

This uncertainty is also one of the reasons why the series currently
carries the RFT prefix. I hope the Fairphone guys can provide some
insight into the rationale behind the default-value directives that were
added for the DW9800K.
>> Add a separate device match entry for the DW9800W and validate the
>> common chip ID. Use the matched variant to select the appropriate
>> default values.
>>
>> Tested on the Nothing Phone (1) smartphone.
>>
>> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
>> ---
>>   drivers/media/i2c/dw9719.c | 25 +++++++++++++++++++++----
>>   1 file changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
>> index 3b7ba88fd67c..bb9319fc350b 100644
>> --- a/drivers/media/i2c/dw9719.c
>> +++ b/drivers/media/i2c/dw9719.c
>> @@ -44,6 +44,7 @@
>>   
>>   #define DW9719_INFO			CCI_REG8(0)
>>   #define DW9719_ID			0xF1
>> +#define DW9800_ID			0xF2
>>   #define DW9761_ID			0xF4
>>   
>>   #define DW9719_CONTROL			CCI_REG8(2)
>> @@ -72,6 +73,8 @@
>>   #define DW9800K_MODE_SAC_SHIFT		6
>>   #define DW9800K_DEFAULT_VCM_FREQ		0x10
>>   
>> +#define DW9800W_DEFAULT_VCM_FREQ	0x60
>> +
>>   #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
>>   
>>   enum dw9719_model {
>> @@ -79,6 +82,7 @@ enum dw9719_model {
>>   	DW9719,
>>   	DW9761,
>>   	DW9800K,
>> +	DW9800W,
>>   };
>>   
>>   struct dw9719_device {
>> @@ -140,10 +144,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>>   			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
>>   			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
>>   			goto props;
>> -		case DW9800K:
>> -			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
>> -			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
>> -			goto props;
>>   		default:
>>   			break;
>>   		}
>> @@ -159,6 +159,21 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>>   			dw9719->sac_mode = DW9719_DEFAULT_SAC;
>>   			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
>>   			break;
>> +		case DW9800_ID:
> Ideally the detection change would be in its own patch but I guess it's ok
> as-is.
>
>> +			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
>> +			switch (dw9719->model) {
>> +			case DW9800K:
>> +				dw9719->model = DW9800K;
>> +				dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
>> +				break;
>> +			case DW9800W:
>> +				dw9719->model = DW9800W;
>> +				dw9719->vcm_freq = DW9800W_DEFAULT_VCM_FREQ;
>> +				break;
>> +			default:
>> +				return -ENODEV;
>> +			}
>> +			break;
>>   		case DW9761_ID:
>>   			dw9719->model = DW9761;
>>   			dw9719->mode_low_bits = 0x01;
>> @@ -189,6 +204,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>>   
>>   	switch (dw9719->model) {
>>   	case DW9800K:
>> +	case DW9800W:
>>   		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
>>   		cci_write(dw9719->regmap, DW9719_MODE,
>>   			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
>> @@ -453,6 +469,7 @@ static const struct of_device_id dw9719_of_table[] = {
>>   	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
>>   	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
>>   	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
>> +	{ .compatible = "dongwoon,dw9800w", .data = (const void *)DW9800W },
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, dw9719_of_table);
>>
---

Best regards,
Danila

