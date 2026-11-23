Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398400;
	b=3oeaf09JUHAE9gtb1KNw7ihZUaYooDX9YaaOxU+L9MBF5ze3NfOd/kiXYAwKy/KezMXL
	 mU9updO8Of1yLFbQbzqXt8RwyILgJBV5S0cZ1Udnl1SPf2DBtDnaL8XOlnTK2qg53gwtm
	 HKlPd43Qx9kqe63TBim2RCTJynTDElWStA4CS/LwQ9o90Y+mNxqQLkAyMmPo4E49eGafO
	 Mpa+VoljwAoZCbJ51a7aSXW19prvIG2wabFpNzGGdukvNZxENGOPAsVsTPfPwYMZtI4ON
	 TXOsfOg0X0PdJv0eSE/3AIbeAVdMVli4S0LN1sE8itl8eNfYJtHsBrgydM7B7jlW7OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
	b=Z6fpP6C8FyH/ESlcLYcjdxlGavwJMMXQE8ULptE7FetdXmo3duqOJyk7aKHZLB/zUO8J
	 aLuT94NrvDdaQq09rcAHbDpSpROEcN+JWZl2grrDBpCjjGvKc3Ta/Dofn3bqPvmJ8Dd2F
	 nyRXHi6RfnTHhy2tSDRXN8A6iCYlMN/BowWXg0PR+ffQ5E6MaBXDj1DqC9MSxS9KeZEaF
	 oaWAvX27xmbowM7ZL81v9Tq2eefWacqykXWiPJJhRrwibnUwCLNXqCBd2X+AdGYIOp20H
	 TyGWkY4MEW1dFZa+Tqc6YfSogBMOLGh3s5AFwzJ7ULe2PCd5Fzghw1xQEgmuw9Wc3eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF228606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF228606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so23222735e9.2
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795398398; x=1796003198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=hyMUp7qtXScGFjw5VJWtC8lxSVW/noa4jMYKoldsEQMVJJfY+9Sq7WvD/3a9YtO61f
         t7q73AZbrv9pio+/1SqXRSNyPPVXOdXN2qLGCeDhkhj/M3o545TMI5DNs+JMIU+rn+59
         hQrSx7HzWfe0FYJUWv1i66v/qdPGNjWAH94Kc2y60LmwbXqAu3pTLwEt0Y7VXZjulDd9
         f3R3R90rtf+JjUpCnn3Nh06DQxr5tSV1hu2FtYCgas7hwt3CSBFvmT4DcRzxL4qqo/kh
         7rMae1m40aaJN7SgoLmnR8MmEkIAzWHJuJwoMP16c+cMpV4AmIJUpPaareUMzlnzz8mQ
         ZWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398398; x=1796003198;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=FT40DXGDXd5aO/HEhgH1pejrfkRRpt20DDOHz4jY5zGtspc25RDdfthxKYL+x5ROHY
         2+B+Sz2X9Y+J3JzQLjuXrCG3Vh4qpNhTPeb4bZY1D4LI7IH+2ZDGZwkeEPD+KPYigQKW
         N8UMNenTihbtSUn9SgbXsCfGTFMBQIiA+o2DD1Hc8H0XzdIhJogU4eBJDKZ8ax+eRSby
         i/C4QyjjXYvN1twqUWtnvHDr7jwBEv8iHzT0hY9jcWtk+57vxlFKgJnFP+ozVqoLh1YR
         GtkbN9Vi1f3t2Z+4CIn03A7hLhXCtcw9xJ0+SQGMyImN6YObpwkSbQAv8KJ4B8VtiXAL
         1Bbw==
X-Forwarded-Encrypted: i=1; AL+hErHbT6HBNlqgOEToghu1jUUhZIGc8VCBHm3VsjjPKNDPZOYCW1ek2wMRsI2atbdleN7Ko1Y0kyoiIgJLIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z89pRIw6uSceL48cKp1JNcwUflNMST2YTKy/3//j5bUeeuUgC+c
	G97t+QypsB1m3lq/rtyc8weQpCFttrJi992elp1ouzk+Ah5Op1b65VejKoJbuuwEJyI=
X-Gm-Gg: AZFdTZe1oHeyEIGBIJkYKYWaQw3Ojiri00LYPGOEMbuPPKdvSxDe+T8Wi37LgW+7cbs
	OkPifhXS/8NBQpnU2SVC6KpscHzn6AHmksQqfzH4BKEFhkREeJFs2DO1FsWYHqvvFNH1uyRd6H7
	oCtjmlH/ij50qC56ihEIsnTbG7dxukPKV0AMvU6XOFSuS6m7HlIR987qtEpNXsY9t8+qyBpSULf
	U5gOc4D5uay76q+w8ALxkk+IYCf1V7Lm7aHVFVJohJ/CbuIf/iO3XYESsRI5qnaBXm3bDhXiKqm
	WyBKJXmd4FVqKOSsNzg7hqehC4ytQ7wHkF8Vd6CvJ4+H0VLsCfdqJW/m1QTV15ddyoBWxF5yVKZ
	P5tW7w0q6yLyt4TtVMcoRBH036toPJelFv4knvlBGPdHgR5y9ZIAK4rUqtybqZ7PRdI+iUx9FHP
	1VJPO/8fwHdpq4GytD5gwYJI8bLtWUW8EOjoxQV63BAewm0f2lBpq1TMyafVNdZkpHoNM9AKIxf
	SlnJE/L+54MhWxLH+N/Z7Y01hDm3BJb69X9gw3HuhHeva8xcbWDy1ToH7O+I2uXRYLU15WlsBio
	ivD7pVHcyS74+YF+jn4Ac8ik4Ow9hPxoV2RGecueBw==
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr210403515e9.22.1795398398283;
        Sun, 22 Nov 2026 17:46:38 -0800 (PST)
Received: from [192.168.0.167] ([109.77.88.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm264872155e9.9.2026.11.22.17.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 17:46:37 -0800 (PST)
Message-ID: <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Date: Mon, 23 Nov 2026 01:46:36 +0000
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
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 15:04, Nihal Kumar Gupta wrote:
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
> 
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
> 
> Signed-off-by: Nihal Kumar Gupta<nihal.gupta@oss.qualcomm.com>

I mean this is a bit of a convoluted way of describing this.

You have one less CSIPHY Hamoa has four Glymur has three according to 
this patch.

=> Fixes: tag
=> A commit log that says this

Talking about the ports doesn't really describe what this patch is doing.

---
bod
