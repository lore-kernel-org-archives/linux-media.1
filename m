Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3F3F6C48
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480153; cv=none; b=LV2Fg96ENP9fUgVXEcHtNboQh5inSVfLg2yb/CP/6IlstknFApX7yW7kk+qWD+eezo7MqcMfaDetI1aNu7mtP3txBoGXHykfsRw6DkxjqwoTMNIA4Uv1krfAQ8J4Ce88vg9A5tVj+9cJJIJeWvlqu9CEP3B9NVymzqy+w5emEPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480153; c=relaxed/simple;
	bh=q2OQEI6d+Tec35kArN+O+0T9NYgl5oyAH46QKy9KqPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLB82r5LToIDWKJkS2x2VFJZw7DTskp9vkgq2ilJ41tcoEN7qlgJDklP58LkAwMFnvItcZ+/LV/6eAI17q+9u2hKeYYlOo8OyU1/pJmL8vcYiNyHaDrJdRRsmT7nVoDk4lAZE2Ori7EibNcKkBeRyr7RCcC58VisVK18dBQMdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dE01KKpC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dE01KKpC"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ad519f5f13so85138e87.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480146; x=1783084946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=dE01KKpCwvD6mEFfkrhc5h0fDAQbU4VSjs3tJ5sOQCiMhxzk1s6GNBVRupxnVxUz3n
         gkzkzOLpRXo8fB4bhseoPyzfFkzzUc6Ws38uMS7a5upffH/jM76fOwFjJsb2Sw6ovTSn
         yJCvcY99gLeHImZDyPJQoV+rfA4CtMNMDMtzOvvebqegMcE73CdMxYOom425sC544/na
         QHqkRpcYYfCD7qwIwSzONsEWezu703GV5wVFnlDhDBjQ2BnIb2pJs2tBaNeQka97O9xv
         VjJZAei8EenEIHPxKdCMLQOCrxiG25nCW4EFx7EUCybYeBpqeSeuVfauR/VXAcucOwWq
         TVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480146; x=1783084946;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=acYOob/dSNfqINbCK+/uwfwCV8QQM69ltp3lRxiwtVSyJhZBWOZYbFzBMSta+erx/7
         wVgX/TElCYQWxWOEsKoM46n9Nw2i8CcjYGrOxuysikqQvWznuL3T7Ve80SUAblt1TuBz
         a99ThLDfqcPj37sylKDVYQOoFnyof7wYMm23CSvnTzY0IJ3nd19qqtQbzycrDN89TUuy
         cGbNVbozDCiaAnpHsKJ2oWWhhhWUc7yefBkUYJhaP/+K9pnTeyttXOn0Xygfn4msrIu5
         jpEeWdDHRP++MxsmghH/lz4U3gRN63LWOaGrSeosOqaqwFKeigaiyU/0Lg4HGlZhyNem
         rqKg==
X-Forwarded-Encrypted: i=1; AHgh+RouOOvHTnYcWndvd8yy80FBTE0gntTVKZBy8GAmKOnP/9Z9VdhgpH6rv8rPZtoB7omSZnvMdGfh1S5ahg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0uHWZ2mqBlKTt16zrDDNLe7tiI67Mb5Dp2CKAvHmuEmtqqKY
	jXgl9g/d9tJAr+xLo85hLTBgY2Dz4vvPtaXWO4T53I/NhDy5hpoEJM7cADaF92vJgm8=
X-Gm-Gg: AfdE7ckpOoTxZIt/k4s60GVFo0Yo5FHFMEEHmvgQyJpMCiRko3X6XlrLimTtQFosaOB
	atx+UODVlw63H/XQrRw37JAVTDQSsSYOmsA3clJ3GNHVftQ6ZFIRMZsXqaZb8UGTrDjwVnAwDgA
	KoVd2eHuQ+cX2Wv6PODEry+To9av4HX6vUtZEkViW+3v3wAf+/xQ5vxz5NTBOhlkf97GtIQUkmD
	4lrDIkrDHczAfxtJ0Oc2PJN5kBCEGwftGkFHNaHoubKzsCNf4BEOGe3dZl76LstYbJqD3Ud682a
	G7SNEXF9e840/PBrTykv3IIZDaNe2Eu0MbkOiR4aAbCFtY7uVnxqubM7LCg8itISwKSs0ZjtzvQ
	IgbtYvKv/uvS6kYWihlnSLVIxsW7hZKfzVtLV9d5ZC8gAE1txWgRZrrZj+qBuEkzUnoF+6lI8a+
	GgYfNFVRyOi12yKJQzxqVBdEQoNH7CndIhm/rCAdzXTMAYMpuK1sEDIe/7D8UCUlwZXXM=
X-Received: by 2002:a05:6512:1252:b0:5ad:4ead:72d7 with SMTP id 2adb3069b0e04-5aea1f630cbmr1249234e87.5.1782480146180;
        Fri, 26 Jun 2026 06:22:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea5195050sm816328e87.83.2026.06.26.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:22:25 -0700 (PDT)
Message-ID: <eaca986e-81d5-44f7-bc64-8e89e5a1f823@linaro.org>
Date: Fri, 26 Jun 2026 16:22:24 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 04cb9230d29f..d79be22108c8 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/leds/common.h>
>   #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -701,7 +702,7 @@ camera@10 {
>   		pinctrl-0 = <&cam_mclk3_default>;
>   		pinctrl-names = "default";
>   
> -		orientation = <0>; /* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   		rotation = <270>;
>   
>   		port {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index abd9c5a67b9f..543fc691fd3c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   
>   #include "sc8280xp.dtsi"
> @@ -682,7 +683,7 @@ camera@10 {
>   
>   		clocks = <&camcc CAMCC_MCLK3_CLK>;
>   
> -		orientation = <0>;	/* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		avdd-supply = <&vreg_l6q>;
>   		dvdd-supply = <&vreg_l2q>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index 0f57b915186b..375b3c0edea7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include "sdm670.dtsi"
> @@ -460,7 +461,7 @@ camera@1a {
>   		pinctrl-names = "default";
>   
>   		rotation = <270>;
> -		orientation = <0>;
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		port {
>   			cam_front_endpoint: endpoint {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
