Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235E361946
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970536; cv=none; b=J+5ficUV950yN3cB2KdKc9ohWgxUAoCz21mfsf/QJrMGt06CYPKOXyxAOlNBRSFND3iLQOsI6derhegSuhaAjP7wQH+NNODMj5dX79xdzlLcXgNROg1zrxHvSQpKxrDOYpzut6mjBIyDu1Sxc4NSFl67DvATkjRQn+jBtvzejLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970536; c=relaxed/simple;
	bh=EYa+RBPbeYiN3nxkpFWH16ycAxJKW6uP2elqjLvjqFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4+R49IdBcvrWjR048cHvUGw4N12erfK/L+sHQieOKW0qVqaa7ggjBJUzaQ/JxT7xNg4eN4MFdhq/9yVNsx1yZ1VFLsMfFgU43vEy7xBydpdaGTHC3czsBAxU0jT2luUMc0sLnQPLMAwQnT2FxWGPgJaz3h/y0DcTJdWEsrGtbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CcuwfIzK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CcuwfIzK"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5623241a12.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970533; x=1792575333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzIz0X6ttxgOxkC5LXT332DK567KH/TTx/ooIFt2UKA=;
        b=CcuwfIzKEcmfnSDgOAP1fH4Gqvq1aJwKo8ozVxlTGIsCdF8ftuieVFM0HigI3/2hdq
         8N82j7CZUlTKPP1eDAtGmR+k4j0TZ9TiVvlxoa+nb3egYr3nyEH18fza+g0bJM2ovUlp
         1RrTKQgVlj1N+oMDYeqP3wLxHinDfZYnG6sfsiuusTkWV0HEu4W2FusY3oKoyLwvdCLO
         LVNUepZ0+TE6/9t8Jq3vksMDJKOe5qRzl4FiQkGSRDmX1CK3dJNxBuLHGEO/MUZSPSRN
         4oHo3QmKYMUPkSm9EaOSDv8yTohbp56u5qVrVMsLCR5BzIBH5L3mXPOkgTuqfFvUIy1s
         XEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970533; x=1792575333;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzIz0X6ttxgOxkC5LXT332DK567KH/TTx/ooIFt2UKA=;
        b=FKUEZA0R4xoCNqbyUAk9lw8YFffSCNSPY+9S8+Xgo4A4taSMYhM8PJq6SZkck1yvY5
         DlJxF2/4WlCE0wVMO44KsHGDOSDmVL3f7wDx3ZLOH84XOgUPsQmjeOFJd4ucXf7eZsTA
         qzGgN6tSIre4LBPl586pV12CsRiLbg+xs0ENg4yfEr5ZRKtBdEx1ULuCy0HCa0XPhrKd
         YiRwob5qOdLpedV6JRYW0rWKT3z+gKMwjU3AnBdL5zxnqdzmzSA0Mhu5j7Pq01OScPJS
         TmFtJ3c4h7MR9jSnMk2txS5joHN7nz+Dp5FSAuBh4dP85DqoDjA8QCFDDu82SjucPvkL
         Pzrg==
X-Forwarded-Encrypted: i=1; AKwUvBzveGSz4dd0X2Bta86LKSKqs9M2Sgxi3MLMaA3hGxD6dmBxsRpS7CROV88S2mCljDKcWd9NW0cgbj2MpQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/nIWfOYOW4beqyeWukyoW6SgjlswSwWo2wMbpO1BfxPGrHQV0
	5RDQns3DCNuxdxuIPtRTR7U77muakFyXYFz8Uf2epHHwjD19r8UQWGq+TOuLT4SC2hw=
X-Gm-Gg: AYBFou0MoEzfVs/9/RB+PVEkP3deiZ24IFZUDRKvQxDIu0kfubJSWsqN5trBbKb61WF
	OzbRDz5ZOu8DnZj79A3ohxbByc+aL7lmkLoPX+KjFb6+hRhTUEz41sC0n3brUP+bDOVvPn4QbnU
	BFaHQ0qoMSdePtkiiPydHJzPnZp0v0j7bWkkP083j2mM162P/JM3bN2vYEZ2Ngsqa7Gf9TLd4EF
	ddDTkGyyRIinb4O121u73xlfGAODgD6IdN0hmkdnG7E0p0uwzI3Ojt6GT0Vj1aIdj3RGYBEmnm+
	EeqTQnPU9vP7BWJeoHJwCcmrhGXl7fvikW2tqPPvOD+ZRJ7qKJbg6/Nt238MmNoYdXi5gtR3qup
	gvz0QlOlr+n1JoERF5Gke86wme7fhOaA1E3j6ale0XFwfrBznF5O02gEoo7Iu7O3PbePTM+iIrN
	A6EhHqsJCF+M7cru5Sr3R/H9NPl63VCoh7VQnJtAR2m41eKHhEgZQDCltBSGDCgbSc4m0bWTeV1
	YpvvJMNJeP5
X-Received: by 2002:a05:6402:2351:b0:6b1:b626:5bd9 with SMTP id 4fb4d7f45d1cf-6b1b6265e2fmr7285065a12.0.1791970533495;
        Wed, 14 Oct 2026 02:35:33 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839764sm943163a12.7.2026.10.14.02.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:35:32 -0700 (PDT)
Message-ID: <8cb5164e-9f27-4e19-9f4a-37da35fe0770@linaro.org>
Date: Wed, 14 Oct 2026 10:35:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-2-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-2-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
> identical register interface. Add qcom,hawi-csi2-phy and
> qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.
> 
> Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -18,11 +18,16 @@ properties:
>     compatible:
>       oneOf:
>         - enum:
> +          - qcom,hawi-csi2-phy
>             - qcom,kaanapali-csi2-phy
>             - qcom,x1e80100-csi2-phy
>         - items:
>             - const: qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - enum:
> +              - qcom,maili-csi2-phy
> +          - const: qcom,hawi-csi2-phy
>   
>     reg:
>       maxItems: 1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
