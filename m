Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268857;
	b=B/LuVkCcaorLNNFgccyWXVYyT1H2+VVX4Ag9yew96sJH3Ba5Mo8rP22JuYnaGexn+HPy
	 uP+IsyVlBR/FlM6Jn8p2d30iHm+zZkqlS7hUMxgCqAJzVqI18PxpFs0Uln4oxavnzHMYB
	 uDRdr/He0/I6B9ThAep1cDyaPUdmfiUOpYdVsqjP5CTm6pTZk2RDDVN3/S+JiGQ0JmkP+
	 Gm1ALeHqGGgC7PbBBVzLIKMvhH5FyOQRU/9oiX5YkdQVxUjw/4nBN6BHtbyfdrs2cGYHc
	 8Jl2k4sXYenFrtZUDgFomaeSH4yDSET2HO2xMNu3052mG3dSRHnRSEgxHkSTsXancZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
	b=udzE//giPfEkPfh3NBYp4Jt5AqC0QTALk6du3m3HODnP7XvUZHOiJOqwAbkpWFjfpbta
	 4WVwUkWq5ul9UZQ47YTHITkRCORx8YIQkFAXYAGGAoZZTwmSd4ANOPeSdjzNfIkGnRJr/
	 7OL+7wT4mi/ctnNoOLn6BFMuQaLCttpjioLlzXJ65uisydyJtiRvZSk22TdCzNwO3MZJC
	 Oh3S0lLWjJXYrzqf3J9IxiKtnn3XskyOrTCJfyFddPgXnv3/dp9r0v4XWzX68KQYeKbmx
	 vogjNHtYEDK/88ku2ssusPQ2ySWiF/GPWltlP/qCGk7oKUNlAEIk+Ffdty2BcCaChNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="deozIxz/";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54785606A33E
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 00:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54785606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=deozIxz/
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so1149731f8f.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794268856; x=1794873656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=deozIxz/aGLnxTDbgoDjHa8Nq0xmOsMrD8iijQkW1P4nF7hUt3TN6minRfpOckwpEP
         MH8cy2KjdHGt16ApzZLcpoe+zhdeksal5/pnr6I+TcQRsTCklK2ct7oVvoeflkq0l5cL
         OzQ85Dgs6+w3/9mQwalx+mc491efpiATwmjfct78qe7gA0CFA1q0ZOlQaauNpMBQp7K+
         Oj9dj5lmjukGVHglA8CHXKMpdD0XmZfI29qoy+pGOEslgCu8USE8/FRmf/FYwZFW+3Vc
         3h2a90My3w4IF2oP5UJKDZDIv+ULOx6KAwmIhCIW773jtJliQNO3c/GGW3MCixqqmSK9
         2Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268856; x=1794873656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=roAZ3rglwHVmfvi3gPpyMBkAysDo50zAjmYUcN6nbLUC3ee1XGxbfDVwxngNT3PbnF
         1UT0AJ6gv+A2PRb1/NMWbU43xISMjXU5IKzljWKeTSmr61UYQJ/ASV5G1UbtZ5NbDbsX
         Njk/NLcNHRKYoL3cbtKKN0S1e52BtIrRYDv7n1FZbvMFc+geIPS3187FsYtHTDiEG76m
         Zshvk/KBZKwye9k9Hccskp0pqCUUMvPA0EYQTmA3cIe9sPd1GQ378xEm+/bsj9/BMax0
         iiO5RL/FcC++LwNxCvs1jIRDF9HqA+bC31ktxPUQ3oLHzl6IU9HCh6y6hBVvY7VYt2n3
         UL4A==
X-Forwarded-Encrypted: i=1; AL+hErHrZbiQXnxqtDc7UMohye2fydLv8iOLRhyhUURwFlAiG4fgAj9XSMSnWjZSRrSbFCPGK/D6CI0GmrnQ5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8k8GskIpiJ4SpjlJ89sYrC/OjjxAlvLhIqNR8B3w7KBGd6BTSl
	QEd3uZXIG2eaiH2jjNerjbAZmRKMyjra7OS2Dymf/UgiwymrKu1oPiK6E09kT5XjcYjES2MziTK
	Hyeg/
X-Gm-Gg: AYBFou0aqzr3/n5G4xVJZcMjZ0FoWdaxdujmKBrTTM8TrMasp8KLCHfV2DLUstrMdrO
	YVaStUGHJ37T+pLQNVAb30ZdqrE1DidcOp8yMuRXri5mq6m7Ifq8+xiT5UKJoDhIie/2wHhorYg
	75d2Y/fuHMx3HzQvpVrbTymDFtx6tAFzU/mLFILJRBS/8UQx9JYvEF7qIyq9I0hqCSmRJS/budr
	PrKULqCETXYfY2AGTXp3WpnfcZLkriXZFML32cYyGloU/3vSsWV5FygIbXL0AfR1yxTONPj+C49
	yU7EdeR/DQx9TzdcaKoyMaxVBsXDGPXi02WI7/1pC8VqXZGolcQn2cSEqhCqO8RjNJEHNxH1EXd
	L8dJqiX+pnuDMIUSmhdlBL82Yn3hk3rN8byq9FTXrMDRRQ029P7j9aQZhR81Q0w0Kfdv3nhBoUy
	x2X9bwM3qvZEltEhH1o2l8D3QbiMVq/7/ECvfW8wMZCYBuxpSk4omjfkW6QNuzefAqi/nHXEM3+
	aHJl+Eo3kmsmpviP6VkwesK4IX4AC/bwG4RSAKscHSXkBFi0fJDDvyFmOLttD0vPe/22FX5h3U0
	K1eDzpa9YA8P3PMjFd9Vztiz+bgFs5DFJtgCAr4=
X-Received: by 2002:adf:f391:0:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4982f2b5ce0mr1045706f8f.21.1794268855287;
        Mon, 09 Nov 2026 16:00:55 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm1882531f8f.42.2026.11.09.16.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:00:53 -0800 (PST)
Message-ID: <5d775896-5c7e-4830-862e-a9b02b840177@linaro.org>
Date: Tue, 10 Nov 2026 00:00:53 +0000
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
Subject: Re: [PATCH 2/8] media: qcom: camss: Add SM8150 support
To: gauravsuman007@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 22:38, Gaurav Suman via B4 Relay wrote:
> This was written and tested with the help of an AI coding assistant
> (Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Right, well please review patches on-list before sending duplicates.

https://lore.kernel.org/linux-media/20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev/

---
bod
