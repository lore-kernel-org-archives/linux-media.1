Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446956;
	b=2R3f6XPgbGmdoeWbZnKHFKZITF84+KPzZzwKlhpIMqE7FnkqNKyPuw0vS3PALBg15bJp
	 OqD34MAELRkLScQJ31DUNay/HwopcMlgN3F0SD8QlLIt5qEHcYS6p2ZwJYjoJe2fBeq3b
	 RA0rimCJSqs/l4+dhMGl3oalf3ugy8urrYDX901RbzW1LwydLcN2dtDu4OsJKzxYN3luz
	 ansKLnDx5BEw/St3DITaOuNNAj7eYmQCI83hxhSFm8ieyoWxVmhdRJT9fO+eSg5A+yCpR
	 EstExDOJww9v7p7ymXKpvFG3fAdwIeZEWbljOSRZAW8U0znS0GaGjLx9AO3KNQo+4jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
	b=xn+US+gvH/sTCNSrV+wu0u7yYl8aJ7f0RmuY5/tB05lnsJXxx8Hb92wsmZ2ZBO1EpMvT
	 3uhR++10dAlrz3TUaCoCgpQg3OotDxKVyrXQJQtuXLSI7w7APOsO0X3kjJNCQPRUDwGpT
	 TbPqh8qdJF3SiA5iuWxQBwkBUasSXtYWRekDFkroT42jRAYHoejXsWz7ztBtBe7avTtJ3
	 1Bew84WnEeSFd1XjMlOgg1iwVnAIgJbct7CcKYMJRXegWoKynaSGYGI0MxJ+eBJ6J7Rk/
	 0GK+L0awjtHiD5eRJT1evjpHi7JFpUXH7SguV467IBENg3bOh158ldRb22Ec5UmkoDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1CA606A31D
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1CA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be3ec14bc5so262841e87.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793446954; x=1794051754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=NkoH1ROubAkIWDPJ1im0+DFkTYQ+QDsHYpHJ1b8JVv+AUR9kcj+duOMIfsmFLCq1qK
         enT3w2pAHrpQwp47W6dI27rwi8EKz3Iym3s5uKJMLdj2KZj0A/NjGOeM3+lHpRb/LdSq
         08bXx9xCxLgeuqrMci2rD+XbGl1mFl62Uez72WHtSsnnX+HEyTmEV4tDW+n0x6alneih
         VqRZSvP6mnGJy7CI3mEWU3+ity1xemK5Rfjr946pzrYEcW6GZtcUOqgZKRBRD7MmnrHW
         OZxvZpWCHTlwzTqocCke0IoUBhtBN5m9ZqSbDbFUxPTzysYHxj9nCiT1lcBDF5ZuKL0d
         W9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446954; x=1794051754;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=rhxuSXw3mKRPtFhbfgw29NSAnUuc8rWZipUrJoH8cP5z0UjlDZpOJHjuRGkeZWsRcu
         S04qEN5NEt3UMuzk6oDLFsIc5j/tE/S5uGsMkQ1VdjaAtgTy1DwO/vOZX5YGHdLKTe9E
         uzE0NRv6NtvtWp650IkFiDtkmR5HCpi1EGQnTdG3Er2JQvcDL0JusscyzAS4mVoxj/gW
         eFAQbYcIVLXZJuXKTWBLi12bkDTcKMPDVMyhpLDjMg3dO/yS/Mt2jyBzBAVznWv8ZQjB
         5HaZRxifGcE0xNYbMbbPfbdpvFGmZ/A9YbSqaEEKaIJK6KbyikehUrMqA7P3tYUMS5Ko
         4U5w==
X-Forwarded-Encrypted: i=1; AKwUvBxwRuQ2W5+F2KekWI81FQOTqmgKaYT6rFpaT4C/dCun3s5/xUW0ibLcC82ijnaOrZGz+x+aySrIT+Eiwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK99CvmI9lWEuwlAtimDSExH2x67q9Olpx4vrgT7fa13GglYAFX
	wxfUR2MQ/mJYQj8tUuu8bk6EsfYLERIyb0c2M4ZI4DN9I013ThxTkfZetD8LCm1+t8I=
X-Gm-Gg: AYBFou2GTfXKI1GNxaViFffUbQYX6ggnqXLYsjcpERqBE5nTWu2jzKv+7Ck8F86Ljhm
	rB80ibmlgK19MiROGOqiw4P3mRx4vjINplrN2F361anbNjBHbb03gRci3GgR7EJQmFfhtI+tvXF
	jCxT4DCoZaWtyIO4qMfBL3znRi5rbceFC2XeXxmyCn6gobDu+WZs8FNX1odhBtTM/ZlVT0KBKgy
	IDhFQHtVcJ1NOsn84Iznq1XlnmayE3rWPP0rw97YdzuJExHgZbrHYKyYZ3aioSTmWx48A8mK3if
	CiFHlZ9HYyND17LtACMZgDTxR92btf0xYwQUeX5ae9vEve9spegcj4nw0Py+xAaYMcjSw2uttg0
	pdFPLaai2vi/8Tqluvf19xf9j45GVFp7JuidqjBjEe5pNujYuXpJ91vrRcgFyU64fLf0fm3OxXD
	p7cxgSyGpvZtSvWIOvSyEMIwmg6VVoLUlI2pWVCPCZX6r0ngV4xQVYYhFgLeMG2EHL3lRykLNgK
	iMgWqK6b6lslB7TmDXrhpu+KqxBs2/akta5yEAMIxnZ3qJ98S9UCVWFpeYs/4d5Now9NGdYICgv
	mMo2sBwhQdbmpQyrhygLGSHaASvU8e1nVaKZeeI/3qyYdStNOUWRWXB9NG1ouUSnqEQ7VF9dPam
	eIuhLrGU=
X-Received: by 2002:a05:6512:220d:b0:5bf:b8f1:80ce with SMTP id 2adb3069b0e04-5bfd9578721mr1660720e87.5.1793446954460;
        Sat, 31 Oct 2026 04:42:34 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740446sm536809e87.61.2026.10.31.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 04:42:33 -0700 (PDT)
Message-ID: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Date: Sat, 31 Oct 2026 13:42:32 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 17:20, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Wrong, it is NOT compatible.

Due to the functional difference in the register offset, which is
described in the patch 0002, it is NOT possible to fallback to
"qcom,x1e80100-csi2-phy" compatible device driver, and there shall
be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2..6e9eb8e265df 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -17,7 +17,9 @@ description:
>   properties:
>     compatible:
>       oneOf:
> -      - const: qcom,x1e80100-csi2-phy
> +      - enum:
> +          - qcom,kaanapali-csi2-phy
> +          - qcom,x1e80100-csi2-phy
>         - items:
>             - const: qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> 

-- 
Best wishes,
Vladimir
