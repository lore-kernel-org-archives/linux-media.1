Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000385;
	b=Ud1bWkvdcBmdzD6TFDXsz8+JI1QDUGCv9jzaKZZePFSXEsSzLr3jMOEN1dwxtpU04yQJ
	 NZplbZ3qjARhMEoq08++WseNPF1YuJ/QVzLN8+n+soVT53X5hjZXDxMsVfj4sx1tf3v3E
	 ge6ou9XDLhB0gWibRovgtmvnZLDFBJF7JRlt6e0QrPX+FfiDxqtsVnAQXf1KYwISnv5DG
	 LKD9SOV4jGX8GHIO8gNaPInlgmyBQ5GF+WVgBFwpYEwqekiC22RCblQk4fzIb9dpTaFaZ
	 +yGzBEKLSD3avZk1f5G04FDb4eG5YeU+WLGPCEzDjxfJf6oUaCAt16zU5bLoIvFTchA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
	b=28yeOZ8q51sYCSBRZDHx/ad5BStKOlUNUQ3zqjclkXlKF6eYHeAJulEQAvpW3F76tarJ
	 zdtjc5/Zlfd00gHgfzGrinXS2qLzfK3E09UGhUrWYwUytBfBEfbisuFb8es2ZaSA+zJlf
	 urP7b3IBntgh5XctP6ab8r8EGUYt8QMMn55GAoBa9k9tubt4eg7iMvopMknW4CDnVASYf
	 DDl26hFO9R+12jU0e4Bmy3nFOqaqmrIfCQXpiqS7PAHm/DYyRZtDC/eZ7ICgcaSTi42Qw
	 aljtGKIDvpJ5sPpL4MgIpE2FGg+awmBRzciLaG7dt5Qm76Mt1Cc8JQHcQcrs3+is/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BAC606A339
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 21:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43BAC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab1cb6eb70so1202811fa.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794000382; x=1794605182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=fElw+eI5A1w3IHAlBMJDLXRdBdImdRRuG7tpGlwkAMmBHAk16RV4TH/P0ZmbfhQYpp
         US2j+t2uTpkkH6Tvzs7OH4p4mgNUfQ9kbl2ANOSRPJSY34f++LIT70jAr/dBguYOgU1+
         0pfQQhuSZa/m9R5bhgoimw63HMKZMgihXiH6MUVCIYnXubaiAJZMT4kjUqLQLQYamQV7
         ADuxWSh3ffVdPJN5Mf9g8EhiqF/11g4M0XzKm2TlnCPDha+NBvRjeJ4Q9UjaAIb8cAIN
         bEsbw5aJM7boNpVe9K+HcYqpeB60vwmXjr/2qzSbU+YM6FsexXa4G+xwUar6b+1OoWIe
         6KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000382; x=1794605182;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=Vrdh8I0PtQTQC7WP9xCmbChy75WSCTJuv3CfgNy03kZipNjyCVwNbdWpza7TF++pAD
         XJ4JORP0EuPS398KzmMj+UVl4SR7fvUXHyHpMD4+FYZWd4Wlab9B5st7XINUsWcYpXwO
         C6+wNGy8PH6ChdGVdlo20Sx+N+QHKwhDOvE9I14+mImttCoBvZTGpNmtVlj726Dv2iLn
         0ini9xZVgxff0EIYoM48v9gzC3Cl9eLK2g/ZKILztUkbZW3fJvsfHfDFQwXF5SqT0yrK
         hPRJkSWVDGSXvXlOSXqg6IZFXtPKfFq9ECrdgPhSjnUqZMLnHUTfF+G+sKI8twuDrbgb
         TxoA==
X-Forwarded-Encrypted: i=1; AL+hErGlHzlKVH/VpfG6bF6NM5UxGzjMa53OGArhcyZqn9+V5nGvSlBdAEsE1AwZbUmotJvQQyDTY0+FQ087Rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NgDfGBs65bq9udNb0VBw3YmZK460ZZVSpbeCjCAe5CQxMES1k
	bZv7Y4vCal3oSI7ogsSkj4eV2ZzgRBeYKC3uG8Aco2EpUL+cskmMNGNRc3Aw0WE2t7Y=
X-Gm-Gg: AYBFou0DgyvkKMlWSHhaKCQB2RrQhMboBklyCg+hZe/AI44oXIN4pmXqzjAskTLvDwD
	EI9leuOZ7xTKIRq+pp8x1HnlPrkE4WjNAY4WcTGub8LRMgjmbAK4RcXavMythKnowyyfW4G74g4
	srLs3sFIEAgeUBrJOkqj0Zu/IORqHH7qsRM/gpKjcKCEvqK9BhNKFUCHnCZbUV4ECNwi7xZoMDw
	CdT9OTEwKkuwPZKa3+2S5cCCaD/QFjgwIOsCa5mh1G8StkEZmm8USV686ljrHRTaaNYY8gJvFfb
	JBMl3E1YgSg7AGY0q/ZcGVwgtU9oq5hiHT0GlaT39JUkx/yz1mCoGKpOISRaiRnjvBBOQtGNI/y
	ax2z6Rz2x+G3T38Td8uD/IBSGbE4NyXRvXMHVow0bGXWaUkelWU6J+ePKx5BcFuxKJxdvhVyFj9
	94JyfCEbJagOcpqbFPb0Fe+phLJAlOrtYDEAc5w12sNJ1gMR4zMXod6d3GPUtGZr4iKXAtjDYKH
	L8K/rDN7oxO5/HKlW0uhPhodLaWHEg7JyFSLT8LpOxojEcEfmgQI2U9QkMReL8u7L/yGRengYPY
	tdAOd2wCkUVhxrE+mydRLd/P8edCGvglB3LP5NjJqKAkdKjmFurpRKpCt5/YK447BHH5RUzSx1n
	greTfX3rfL5Hny0RA1QfFalCxSNg=
X-Received: by 2002:ac2:5690:0:b0:5bf:ff57:b346 with SMTP id 2adb3069b0e04-5c003c44406mr1296500e87.5.1794000382152;
        Fri, 06 Nov 2026 13:26:22 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00ba6e7d0sm4667e87.64.2026.11.06.13.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:26:21 -0800 (PST)
Message-ID: <ba22b7a6-83a9-43d3-9eab-93503e23a76e@linaro.org>
Date: Fri, 6 Nov 2026 23:26:20 +0200
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
Subject: Re: [PATCH v3 1/7] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 20:35, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..1e7a8efaa398 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> @@ -218,6 +219,7 @@ allOf:
>             contains:
>               enum:
>                 - qcom,sc7280-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>       then:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
