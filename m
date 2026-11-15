Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744225;
	b=SyXB9qh7+OVFKWsJrap9tJtxK1L6Q1bUuWBhG3gCxMuYvOsnJjLMjo7HHwO9WpINPyBx
	 sx+z2TMjN3EGHSnJqvkbEdLZe0MaA10q+nOmWPsn4UeHUqVX6uK6UM//zzr9k4HZoY75r
	 4FAk586xj8+iVhfpvQrA/tomt98/Z1+1Tgay9bIZB5Ypd0b5zXK+/GUxnu+DCuo4wRdLo
	 GGd2JnmiD4JtOHP6YzCJucwLJkuR87Ct5U5g4yOWuFa2uNuv/btnGm4ibEvQ1V892ieqV
	 8hsLq7eIbhNt2XzrVapPQ1oFqKDFuOifx+3RECtlUq8iZryCX1ybzFyNvQQgSWOV1Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
	b=5cdHtLNo9nvtYNwPi0LFD1UIV3LpmTvAXaaLE/jIx/0GPYBkCnHqwEoBKDD6KzcR7HDS
	 DmP3kuFp5QUp/84sAFNzSt5/On67tIltuRDww8/ykz2iy/lPLymFK8ZR+dJYio20GfzC/
	 aUv+WRhkAeA63AXJc8xD9XpBkE6Fl46LbAkI2gd7id9pemGm7WLwY5OnIKdu27bVgGePJ
	 FbUiYrQVCOIgOk/EsD82kiT19xxkM9woYi5/BBir4CYRCuxtfOHjG2CsLwKAVz+IH99dV
	 6EG5rFVtC+JYAfQ4Fzc+BBpySKZNzgTCeOzBfxoEUgbyjW3aF4/W8TpK7d3iJZIOeuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E733606A323
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 12:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E733606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so14295375e9.2
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744223; x=1795349023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=PUV0k4wiuHhnC2t7Hsp/WAP5J+moB0hPEz1xgcSUOumUT/V74YrWQ+u4/kcDQAZZAI
         FU1UcT4LA71zQaO4RNN3fDK58kEm0gyjmnHcM9RXVv/QQUcKWnFnRVFUJIN5LvgOmRbU
         CdkX2MpZzMt3w1jVBaRwXSai8LXU3yenBkKD3eLHOTo7bbQWZTnRfd7OxqDr2Tm7aqgM
         tqbEjAIs/onLiVZMqsDdlB+BeBjSC46vX/IUEnjCJMfCs4q473Yu0+LQXUWKpIUAmuWq
         g5GqBSIfulUimYpqvkhkiTnwvyFlIbN6ai/HPSelBPAghTiFoksA7JqN58Ta6+eI4q4I
         045Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744223; x=1795349023;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=vwWN+7qbucJUTO9kQvbIL0q7RxHI/mCE9NvP/i4NYYkS3353l3umiK47MoRBdE/bpn
         J4qwdPeHW079lUaMoQ2Whw1vA81N3Dvc3L3tJXgclK3Go6BU9E+3Zk47RYzzvpvaav3S
         dYPC8KUnIeYilEwu/Z/K4Yl/zNwwG2tuvVy3IUxfa9y6Sf8bp/ngfLhTzfGTKbj+P3mP
         UicGoq/zTxV/3MluUozVCJMye3fAHAXsgWiXdQI1n0P1nHFgIkuS1Ikwj/gzJzDC0mLX
         lcRVPLUBHHMKHrXqlmjrgkAFr22BfgU0EIWX9Se36uWQTIzuCRri8NLSGiKaOZztWGAq
         d15A==
X-Forwarded-Encrypted: i=1; AL+hErE3vfZBX/5c1yid9dD80vtLEjyny89URiRfqhfl+rR/E+fT2GA/22YtSsEJL6LhjNKWwgf5kYXMcqbwxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LgAsk6HmpaWXFyZrkb69JVQNhg7Qwr6/E3wp1jmup6Vqhchxs
	BzJBLeREeqU6uqYhQ0UK1hQJKMsOZ7gQmcZLa+fquwl6vbXrIEh3wRJ0HGkHxnYGrcw=
X-Gm-Gg: AYBFou2C5ofs7NXt6EJbYTS55vP2zewcDJ4Plg5SUEDPyiY3qna7N7670MjurE1mWT9
	onIXo1UxXlbh+eEfirSp3hbrSuf484r4KSyC46Wk7ZYJfNvqi33b7H2Z5ObW1ns/VHdu7UcoxEV
	9KI9HMe5kIBqGRYzQLbjmh9jcnjWLTEQTQZa7L9qxqOrFOlmvJsNSlnV68lrbEvmpQjMU+CsPXL
	+8Ua8yW+cQ1mph08wIYxqgwffPDbaEzfouxYsk6531HhbtzuTyuN9nY7VIWWyZTvNsGlEm/BHb5
	5+4SvZxdNBGOCqdduPs9jOatwgntmYC7OeENaC0xgLu4PBh3+qhMrB++clOkGTHqbzpJzEcTPWE
	b+QFOQ6fBbPJGrcpwQ0NG+/+P6UQAxZjHrDusUUhjh1ERG0JZu82NwrrHdS9Y3YOcI0uhOtuAtj
	isv8JPz3+hPZvwi4lCSi/xISsDqujcrLjVGeslU46cHKou5Tut0QmGX1DGiWSwSsFvzJzeTAuVR
	joYr6zFLkJssayZ6iI3Tp+RmGoQsLV5jwJl9najtN5gl8fAZaWqf1/2LWhth8ROQTdLbjXPjeL8
	h/iXou9NkpZTW9YMtTT8HejK9Qki8MFpyV7d5xHxU90=
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr148644995e9.3.1794744222495;
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm15371401f8f.29.2026.11.15.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Message-ID: <31101889-9d4f-4863-afb7-0f884b50088f@linaro.org>
Date: Sun, 15 Nov 2026 12:03:40 +0000
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
Subject: Re: [PATCH v7 02/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Eliza CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Add "qcom,eliza-csi2-phy" falling back to "qcom,x1e80100-csi2-phy", as
> Eliza integrates the same CSI2 PHY IP.
> 
> Eliza has no MMCX and MXC rails: CX feeds the existing "mmcx" input and
> MX the "mx" input, so only the power-domain descriptions need updating.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 8ff3df1d0d2787b2af0499c1e4106b86f56ff82c..884984f6f6b9e595df9bb3b0027c0bcf285b8058 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -22,7 +22,9 @@ properties:
>             - qcom,sm8750-csi2-phy
>             - qcom,x1e80100-csi2-phy
>         - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,eliza-csi2-phy
> +              - qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
>   
>     reg:
> @@ -48,8 +50,8 @@ properties:
>     power-domains:
>       items:
>         - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> -      - description: MMCX voltage rail
> -      - description: MXC or MXA voltage rail
> +      - description: MMCX or CX voltage rail
> +      - description: MXC, MXA or MX voltage rail
>   
>     power-domain-names:
>       items:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
