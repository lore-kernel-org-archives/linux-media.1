Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5422F12A5;
	Tue,  7 Apr 2026 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549147; cv=none; b=hQXA3aR59gdbdd3O/hDfpfa+2EpUiht2otfVkv6ko2MPca4HAO7X4VF23XGolNoV2ElY179PrTUIXxTr7pnoxv966WI5DiwwNX+w3gh9Zxhi6kUUmyy6hVyFPsBT8Gr39v15vAxxkUw6gXARRCWXz7o6cP92cU+sPQyaFgOx62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549147; c=relaxed/simple;
	bh=RmgwqP5jwUKkLStlpLUweK6/Pky7Z3RiEvuj1pxRqks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8rjVl8c7oWYx3DGXdV77+45BvV5GpPjlDf0/y3FCBbjndJYX59ZKezCN7ajP63SWzM/E30jPW+2IRyDB1NnmWJjHRQ4BU2OIYID3FuoQbLKCVk16u0kfWEsfnoyFi75tqe01A2rC9Qnj8DGK7VHp7Wsh+CvwJ5nexKJ7YhnMSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOylW1RL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOylW1RL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD29C116C6;
	Tue,  7 Apr 2026 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775549146;
	bh=RmgwqP5jwUKkLStlpLUweK6/Pky7Z3RiEvuj1pxRqks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOylW1RLoadY80QuJE6bAus+i9pN4yWPEJVUfAThH0Mq2CWavqfDUQFL02nNKEXgr
	 5HuVoJYMOKxKBEUyweuqD4qPw3ireL/jqR78Q9icsZRIjYHFfBzVXq3qrduYoOkrMI
	 jpbDa0wmNlGimQ4L5Ye5zKy61C6YzbvfPrEpjxOozsAFk2wVy2PIgwXpfrpBFkiAvc
	 RLVHdM4egaatlcw8BWjiPiq4ULENxNT1CnirMW+q3aPwAh1Pg0aWHZariQ5xBUrRUF
	 k246omUWe38tfuD7QdrCKgKSV8ooKeCOkTYXqTceQvbEFYzEGzDXwo8ZDjEmxD0FL2
	 ZZsHUvhSr5ijg==
Date: Tue, 7 Apr 2026 10:05:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <20260407-kickass-beautiful-wallaby-9a8b94@quoll>
References: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
 <20260406-milos-iris-v1-3-17ed0167ba6f@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406-milos-iris-v1-3-17ed0167ba6f@pm.me>

On Mon, Apr 06, 2026 at 10:19:50AM +0000, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index e1a51d43943f..07aa398c9695 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,milos-dispcc.h>
>  #include <dt-bindings/clock/qcom,milos-gcc.h>
>  #include <dt-bindings/clock/qcom,milos-gpucc.h>
> +#include <dt-bindings/clock/qcom,milos-videocc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1517,6 +1518,90 @@ usb_1_dwc3_hs: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,milos-iris";
> +			reg = <0 0x0aa00000 0 0xf0000>;

Hex, please.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

