Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26D43DECF
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123581; cv=none; b=Mk9oweqf2rVPj+E2F8GCubAdQEqSrORxh8UWp7fPrMdA98Eq2FXraFZBNGQbhE361Z8aGYViqkdpZVCD9xT27BEiOkOvXGCRe1qAQEJNE7NLDHWLRTnZGsMQ7WxG/r0iBl7QNH7NT3PyxXrZiLc8RpDtJ/LWgU/Dnq9Ebi4pV2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123581; c=relaxed/simple;
	bh=Mx75fdpeRTNkw4KeBmIEIoCRVqgcZv366RWHlIgv71c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWGRe3FfR0C20gqIfG3WbhKizkWTDF+rsIP6jz4dazCGYDFLz8SwS8NFxWTgkXdRVgDOXSSTw1MSk+UFTh3lUJ+oo9UFI+wjMOpzPW7NMo7N9yd91EaYt8Z+8/UzMJKn+lZL2Fg7Iz/Z0Noql/9f+QqqWQT1wrzlB1vijjMAgiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbwyzVwg; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbwyzVwg"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1139447a12.2
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789123574; x=1789728374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/ldHHyjiJV51ygJEvRBrhwY3OPqIXDkE1OeDssrcjg=;
        b=YbwyzVwg6/ESgqjzZWcr7+oHKzlb5iTBbKz4tgzo9UEMlLePuW4oTmPQDL+UK7663b
         pKSTqMnlmCcPA90oApEV0v1478muFH62nolWKgC7vmoXGD68hmpA7qUOlgAQm0eSnYQu
         3PJjmQcg7PusS6DM3AunEBOeJvgBnB4nc1CP8DoixxzLuKSXSdBaIt72lmbPgUlOIcIv
         MnM2NFJLUqtPCOksA6fYeqT7Fj1S68p0xthi7Cjr7KCRx9Gn7J22AajlJUrjxZAWp/eR
         ShEQ+uV1q8BvDJ6zKal07ccUYz6x+R0mxYbxr/sns0CZswo2YkgjUzwXPKIzxq/0UG8X
         32xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123574; x=1789728374;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/ldHHyjiJV51ygJEvRBrhwY3OPqIXDkE1OeDssrcjg=;
        b=qJlU05mseqpeokcBaGEoL11HoxhDQ9bpMjgDQyLqdpgrpGC4/D666FgKRw0dw3555E
         qJ2/ogcJjD3dBdfhkdJvvQgbWKFR57v1dRO6PTS5mTSGIoEJ1vZN2QLGlIcLu2KISLtR
         79+/iVBU+afcFnqqF6VRn6U6SJxm1IMnviJCCiZqbHySxrdP80t2yUZjQTTndkV1Ag2/
         MsfERbOne8KEkQX1+WHrhJZnIuzXdiUZVSB7FCXA6vjiTvb0BujNl9EJnVyHnxqGBtLk
         3GJVBYw2Y9ZRMmpy42TIZO9VQuccdngtMbbihFqoAteHX2zQPjFKKLcvkYW1xHsa9Duy
         AYYg==
X-Forwarded-Encrypted: i=1; AKwUvByNOgyczxRDdOpwTv16rP4Fd6H/wsSuvYp3moMUyEKmq2hu0WycOI1XtGq81202AuIgjuDTdNnvuT0Nyw==@vger.kernel.org
X-Gm-Message-State: AFuF++kbbl9oBO3PEW5Cv44w6BGC/yK/HwqvQCgjsSy3i9nHvU4PN/pc
	Q4Q98BPe11wlafBePnQZ2Qj7s824EzfosqtHuVgeHSXHnB3oBuh7OBhknSOnpJ1/4Do=
X-Gm-Gg: AYBFou0u5tOJ0uyVgaHqUJ+3kkDgmbp8D4E6UDeMfnYfBLfljID0EG/PGDIkKsORiQD
	sMpyCqG3l+VYFtxbpiR1bX7S+JWVCMuwNllpM/TJcKc1rGHRDI+jAL7Wa52tpD+1ipQ2Lz82HDj
	JTCEymWQmg60TOUTdSwvss62z53D3ul4JPk7gIe1j+EubjNeTnwyTPRNS340oyiZjnRe36KVVEO
	OKYf074XrJAv1NFS+tN34ALiDt7bIH4oT8t/G16aiFEWWvoy8VsxmW/Ihu2dHQt7I4tWic1XGkZ
	qUjwbKj8CTZFOpJTXdh252O41CRmxR7EevnbIeF+6iUGd9W60yC/yKm4x4UZaJ2AkEcTYm36CsY
	7bFdiIdl94nFdDFq6vXDdw9SG4Rt4VF8f/XwLUxTLg9Vy9NcwrPfQlqOuCLW+9dCHjM8w1DJucP
	bAANiRfTEvGTNoFaPt38n439EtCjxjFLLCXqCMeg1jMcjgJNfdsmuitAObbYtkQK0jM/Z+trzLR
	F1iCD79447O
X-Received: by 2002:a05:6402:538e:b0:6a9:aff5:c6e0 with SMTP id 4fb4d7f45d1cf-6a9b5641e60mr1236425a12.17.1789123574443;
        Fri, 11 Sep 2026 03:46:14 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.225.241])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9c17a18bdsm188715a12.18.2026.09.11.03.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:46:14 -0700 (PDT)
Message-ID: <e3000a66-3fa9-48d6-a82b-b4ff52558e5a@linaro.org>
Date: Fri, 11 Sep 2026 11:46:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:22, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
> 
> __csid_configure_rdi_stream() now takes an explicit data type parameter
> instead of deriving it from the CSID source pad's format, since the
> streams API keys each stream by stream_id rather than by pad. The
> existing configure_stream() path is updated to pass its per-port format
> lookup through to this parameter, preserving current behavior.
> 
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>   1 file changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aa..2512cdb16d94 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>   	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>   }
>   
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>   {
> -	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> -	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
> -	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> -								   csid->res->formats->nformats,
> -								   input_format->code);
>   	u32 val;
>   
>   	/*
> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>   	/* note: for non-RDI path, this should be format->decode_format */
>   	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> -	val |= format->data_type << RDI_CFG0_DATA_TYPE;
> +	val |= dt << RDI_CFG0_DATA_TYPE;
>   	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>   	val |= dt_id << RDI_CFG0_DT_ID;
>   	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   	/* Loop through all enabled ports and configure a stream for each */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>   		if (csid->phy.en_vc & BIT(i)) {
> +			/* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
> +			struct v4l2_mbus_framefmt *input_format =
> +				&csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
> +			const struct csid_format_info *format =
> +				csid_get_fmt_entry(csid->res->formats->formats,
> +						   csid->res->formats->nformats,
> +						   input_format->code);
> +			u8 vc = 0;
> +
>   			if (tg->enabled)
>   				__csid_configure_testgen(csid, enable, i, 0);
>   
> -			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>   			__csid_configure_rx(csid, &csid->phy, 0);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   }
>   
> +/*
> + * configure_rx - Configure the CSID Rx front-end
> + */
> +static void csid_configure_rx(struct csid_device *csid)
> +{
> +	__csid_configure_rx(csid, &csid->phy, 0);
> +}
> +
> +/*
> + * stream_id is used directly as the hardware RDI port index below. This
> + * assumes a 1:1 stream-to-port mapping and should be revisited once
> + * per-platform src_streams data (stream id -> hw pipe) is added.
> + */
> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
> +{
> +	struct csid_testgen_config *tg = &csid->testgen;
> +
> +	if (tg->enabled)
> +		__csid_configure_testgen(csid, 1, stream_id, vc);
> +
> +	__csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
> +	__csid_ctrl_rdi(csid, 1, stream_id);
> +}
> +
> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
> +{
> +	struct csid_testgen_config *tg = &csid->testgen;
> +
> +	__csid_ctrl_rdi(csid, 0, stream_id);
> +
> +	if (tg->enabled)
> +		__csid_configure_testgen(csid, 0, stream_id, 0);
> +
> +	__csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
> +}
> +
>   static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>   {
>   	if (val > 0 && val <= csid->testgen.nmodes)
> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>   const struct csid_hw_ops csid_ops_gen2 = {
>   	.configure_stream = csid_configure_stream,
>   	.configure_testgen_pattern = csid_configure_testgen_pattern,
> +	.configure_rx = csid_configure_rx,

Keep the namespace consistent and include _stream somewhere in this name

> +	.enable_stream = csid_enable_stream,
> +	.disable_stream = csid_disable_stream,
>   	.hw_version = csid_hw_version,
>   	.isr = csid_isr,
>   	.reset = csid_reset,

