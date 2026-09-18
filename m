Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049946A5E2
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720652; cv=none; b=WshIf6WHZWajqGJAvJUGp3rMO80dJaFTeLwS1JYBXdOdvQHzQAzjPq+EZuQa9c+a2/MgsXMZsYLM0K2KFdzM8AACuKggMObX1OWmvZyhA3gp0xxL+gnID2C+SN/pEDHUTPbWlqqB5qn1a2YwnU6a0xF6l561i0uHRoGzKqOCnnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720652; c=relaxed/simple;
	bh=Uxr4WVyD/DNS/detS6ug+v7NOvEjI5JJaJV4V+VWxsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am0IELLQjdqJ+e6HE3lYFiGf8zbohkyqCGFE+OGwLECfUReAMIrSdzirYS3qO31rmgyW7gHDghwg9CwyC+/wp3Fd1qqE2xdbjNNXcLbkfS7TJtUBPww7Rj8hrj8jqZiY8GlpinMbFZsQXJY7kPUoNQ6Y3chlEOX3agEhRpFGRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUyKAVm5; arc=none smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUyKAVm5"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so64373966b.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720648; x=1790325448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=sUyKAVm5UpfIhhx75ErJhS6MhdSrfjRXsde0yBrmtZLPEhSOoZwsTSeg2sPetwzmSS
         zFDuCjaOq2pfNyh0hC1OWHKqPxYyh5Jf53eCycmrOTuDBreFIljsoVmr98FFBpKBftkE
         dVPzK2Jg0MCAGFcU+cL7kYUvP5E3Re9QxSNA9+P/F4yo5GK53Up9tnhah2OpIna1ZYRX
         JthbQcFArVC/Pmnc+4ANRjvUekvp65CzP1/3xVZfjXTG85PrTvTmuv6Me7DfQYG3g1S+
         uXZKj+0eHTvrTYK0NSI0RAkp7P4GsNJNjunmdrh78Gw51scMd6otBM+8jYoCBR08b1yL
         qXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720648; x=1790325448;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=c6OIJEovJU13jnZuS6wVnrcG6cPyPiYUIIQGbh7ZsTe7jLB5aqG4l9hsXavmbfX88C
         ZY8qGXs1tul9+wql0nrzxqdmAX5DDQFVwGKhi8nz1F3yaVoBLad5poS9FNgXbdrSPUkD
         XDJNzkGkzCgWmj5kXlGMy6bZjpOWq6QyAZbjGK1XBFtNkaco1sa+euHmuYbmihAnT+oq
         0+A/3NkTN0EgQG3aSJYjy82nqariUg9lSIo3k7UBBGiOmwAah/fCzn5zsbs8L3ko+qEP
         fFmna3I0mWdATgSIbyt6hzDwLZC0P0HWagvgIloZlQV6adT64B0ZxqQ4h+LMc+I/6kcn
         MwdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVO06Esr+k4haRHYoHeN7h4aWR3YRuI2LCRbCIqSeFQcORjBmbq2z5IUlUlO032NESvzkvi33eXJw0Qw==@vger.kernel.org
X-Gm-Message-State: AFuF++mlUb0P2qY+L+kUFP+GZ2zuJGXhrs/B4p2kpWUb4ZldvcWi74Zo
	ZKU5ANWG8C8eBii6F0E2T6ZulhL204E8Zx04yaHskjetOCcJqtill/JJ09gv2Eahqjw=
X-Gm-Gg: AYBFou2N7mjRtvBwTDMAwAr5j+N3s8Ycyt4VgYlJqNxL+/WLwTuoPoLRdHe1WyDTZPw
	qC82Mir/m+bIKn2XU66wCCaNxWfoG3cL/yPjWDrmCjEoRX96W8hGN9JSceu9em+yiAZqxN2vE+1
	8Cde6ohGg7cGX3vQ7ETTV6E0HzsG64tPCAr5nYtrG1MKytcqEQGkVLQJURhHs8PVU3WRrQPufRi
	v4zXSmDGmzSqBncAOekHM6I/sKvNAVUNsNAhmdhq3CbVFQdpp0MJleV35uSMDqyxoB0G4qw7+I7
	oAlACrWT0+hC9EgoZUgGlNitbk19AyFrzzReBZpCPjXorAjgKmDfTG30nst6+VoLWWIlnJKxefV
	lghe7YcqEw7W/cPaV2r9DW40Wb+6n54yDi/9QqweYQMpRo1blgpdylYOvo4S82B9GK5DFuAgyoi
	GP/Dmc8MA5u++w7VZoWY9RZ1+UVhVHjc4NZqVCDJj1qWShC4fp9KbssBV1nC0TOXrFQi7pzb4lC
	H5KzDfHeQ==
X-Received: by 2002:a17:907:1c1b:b0:c25:62db:772b with SMTP id a640c23a62f3a-c2a15846850mr191330566b.7.1789720648074;
        Fri, 18 Sep 2026 01:37:28 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm32784166b.53.2026.09.18.01.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:37:27 -0700 (PDT)
Message-ID: <70284db7-a7d9-48a6-acdd-7a9850cdc7e4@linaro.org>
Date: Fri, 18 Sep 2026 09:37:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
 <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2026 02:36, Manivannan Sadhasivam wrote:
> Looks like you completely missed all my comments given in v17 :/
> 
> - Mani

oops so I did, my apologies Mani, I will take those in now.

---
bod
