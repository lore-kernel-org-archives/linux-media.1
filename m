Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612949;
	b=c2TmqSxVoDK3+X6FHtBSB3NLuz7u8NAObhinM3gTFjytqHG7Znc4LykICfuAb3Z2v3/O
	 WcsbT8xp3g1tQBGMiYnRVcjq5C2BDWeJNSzQuMS9kthhrflMRUVQWsfr0lTVzHGqSqITL
	 xdLvqdY9cnzNLgYs7uqnjEdhUVqM+qjcsSwFknSOjqHWfdVuwDVrVNWlyxU9ggsP4zIPI
	 RGgmUCSbBkZH/HYq94j9VOIMIVng+QtxQ9r9Xv94rn2p8cpmIdOZP4Nk/hFc9wHdRfiBt
	 JqgrG6feQSCKFYv4u3lDcDIi0O6zPuRnPrlSNfWvcNILVW1CB8b90rY7XEg+PDpCDJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612949;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=emxCZDEqzWJYlKf+mDUqiOGrtxBvSatF+1Fxzn3DErg=;
	b=RjeS0PbkM7PEFSiIbOEKHCb3aheU7InQQqBcNhkYaqoI994pyzP3tTQJMuhRXr3zRgr5
	 jK52XhRb5MHpH9Cu3duzlxOLB8uHbOl6I8Kf2tmqaF0qVO9+suQ8WjorqNsQ9qZb/k8fb
	 1bOgjk5qabkhkRdgtNlqh535QaFLdQrLjp9+y+4EyHZnGzxlQm3KFFldVt5a7TipQDUkZ
	 noa7UFcLiQYYwHl3oBA8wBDVgugosXPMVnNrEyYR2q+le7DTnGapWASQWEhk1cw9w49Ob
	 puZhMmqw1cjH5BJYsz7hFlwFfW8WYwWQPVhsC0exvDykgFnxuPIqAvnul+W1UeO4XJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMax0dVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02424606A31E;
	Wed, 25 Nov 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMax0dVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEC71F000D2;
	Wed, 25 Nov 2026 13:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612948;
	bh=emxCZDEqzWJYlKf+mDUqiOGrtxBvSatF+1Fxzn3DErg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WMax0dVvZgXApebiAX4owea/ncCsj+Hv3gYSZBbIwWJcAms4ujW/EFru7UPYgSqRv
	 liq/MAk5nS/FodvzWGWPoJiO0FVka013qljWUL4CLrdI0g4PMy391mNIoKAUzxJQPt
	 dmD58wVvYZft4jaAYkMxKxMi6PnD9lvhJe8OyK4SEAPGsZMij+bQ3kPHrlDbk/NH9Q
	 ZNIRCdwfc0kJY7nMJql+CK61iVmmiNRD+HwJE9eKIxjxZzq3XR170cKphtnqm5N8MW
	 hf4cboemDpBSLohT64s5g+uWco0DDRivA9rg/aEwkHT7nWyMS2c0lbGx+sYUKPqbQO
	 Reey9n7j4NYxg==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Suresh Vankadara <svankada@qti.qualcomm.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:22:20 +0000
Message-Id: <179561294019.462348.12092000419789488599.b4-reply@b4>
X-Mailer: b4 0.17-dev-cdd92
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=bod@kernel.org;
 h=from:subject:message-id; bh=rWQ9EFQFoqQKKyg2XNS8sq8Dzx9hxSQ587GJORFIsXA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrBuEMunHzLxOnI45eJbn64QO0L8cOtYEyplyXK
 ZETsgYbj4+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawbhDAAKCRAicTuzoY3I
 Ou1sD/49VTUjW2oTClmGtgYYvMZppDicFSjmKCMyrdaqDzTBej1Cg3ZYG1XYu9lMW2JrbY7KwRb
 8Mceo/4GV8vWPcn727f1qDVf4l142Sm8OQgohwjs0CSgMoMnKjr2JzYe+jOH4qAmDAI5GDRcy1x
 a+R0VJFYhqqYaLiNhCcCDGfOIJtup8x0iMcmZ1zOI5offBJ6t1Nb4J59hXLpQlns62KuZl2Hssn
 +gm/2GS299hlZ6qzStDrY/mw6+8Flk9AocftyIgT2YVFsN+wMPxMj6+aj0lPcVDpQ6Yi62gDL2Z
 o+BRFOdzktQOv353oOYwpo7hbVRyJsawxRbZDDi0OQoOmgx75pTQ/N6WBNakVqmFPxrLMz2JRQ4
 1X4boIYywXERzmCtL3jA8xV7a2N6F7uPIdkAUDYcwXW4wPWHoHPyKi2pIBMXYGpNrw5PPFhbpUy
 Cb5UIrWRz8zOYtm39nZJE71h9xgatGcBx6QRwK7AapLNqp7ZcQueaeDulBdkzFwFW3qO7nsIqDM
 ckMeL0qSd4bAW64KD2VgAYI/agpJctRdPFG63EcM2NnJ7WD46tf6TVwP6RFGNOkJmDnAeuArYQ0
 PFzSrqcZ9MxFVQDlUE4Q014nTtbH+PjCyxZWeaT/VghhlgXAKZ9PGB6WU0WdEbzUgpXNEK9eYiL
 0yo3XzTiEdlbUXg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-09-25 11:18 +0530, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

