Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541635;
	b=4voFGJB2MRAx07fcyCas4ne7BiDUZKXHMEuveDhlOBewJPl0sfjWERc1aHBIp9JJOllR
	 JJO3zXotwEEFcfoZnsg5+OBPLgEmr9cvaAxzgWhIu6yUlAuK8ncbX9w719gU95hFTmsW5
	 E8gPHOVMaMp2fp2oiO+xu1lbM0I8oh5Kl3Hc9sMCnZg5kBmeMXoftJi0kCHZXP7DXc0eG
	 NPTfTvD0ld+WcSU5MPoIwMC/t8wS4bExR98leFsFFr5XyN0oEp0yRCbVGjSvicTbxr8Uu
	 TOGU1ZXP/r3m5R7FXmkwKEZgYCAgm5d4UJRKWMs6QGj1r8iE82KKXkgYL/WueRpp+aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
	b=hWuvDSUIJtlx6loaoMXkc9zsfrJ6DHurHaTQ3kxWkgNTYtfK490PW/fOe75DrPMRUIX8
	 efmGDd87/IgFyfuk+Wx3qKKFVE4QULtEic05edK9DLcK3gl9mAOJjbZIcYT4EUFl4mb5F
	 u4cy1ijAeQsThBbFJGMC+vekq4+zeYHjG0P7QHqKhgLzDhrDqlmxXSr7oQu2Ew9raGQn7
	 sV88aB47hQ/gH9eDNqVKBYj7D+uc+9AuoFI0u5H6mm4At/1XzoOQXfW8SfMSdp6G1pGeX
	 5pT3ODrOFCDXSvlPFvucGMYo9xbljXf3rY/1P18aXJnvQIgR3yMbZvwicWjulGK4ZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfZ3w1fU;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8473E606A326
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 17:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8473E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfZ3w1fU
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so43322785e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541633; x=1796146433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
        b=cfZ3w1fUW0vulvRXY6maReaWXvvzJmwc1lPh01QfqY0uV62PRD0Ql3MA+nYd1kW7sU
         4sJtFXAqxGtI2qA8A3QzaAvEr5J+3FvgDrFcHU8mFT8SpIu9DebXC9lOSUVHx6vd9G+F
         1Wcg3GdZ/hySgOeC2BkuQohQySZFWUy6Ocp2iabtffltmEww6EPtaaXrsHqj0WAhdJvN
         MBUX9OFHj1lAFIkwQqMoEKFzAIAQBaanavY18Z/EkgHm9KzwRFKE+E+t3/UHASSdyJCJ
         +wKeoHNVX8kmqGNdcjzjy49YtvgXgR736vdCA/avn0NhgcsLa3WDOQqRTnXu8DlCYu0O
         3R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541633; x=1796146433;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
        b=TE+TCVMoF9kQdsPU12Wlx6opiiyGZoDBKt9WHSU1jgFSU0bsmr7TwMUXPD5Xi/Zim7
         KWWG6dqoem+8hXuZocqdg8O8P+nON3hUlcnLI63W5voIB1qgD4BsaawAT5jx/KgS8ceY
         LNVLa8nK/HwrltxT1jv30ZhF10pPiOUoMSRvk3fnNd3xjqo80VHrUHYYZX1YgEq34YRH
         FW4BlrqDeME9gwFv6y5z0fZ8VCaSEABrs+5CL6q01FHPhUjvHWEIkV9EHO+s3Nigy8WC
         oNJzFCLUWyTLMdO5O7O4xEn4IMBDUARQD/bBwYs7RHbngx5jzWh+xbrXUAXHdRy+2rdz
         tccA==
X-Gm-Message-State: APuU4Z+VN9yBmNpEnnlPCJrSUfxkh/NN2TtntrXj86brXnR3xBUXdRh0
	97hmebZ+cH8wB4xdMYV1uBVxDcG+TPlI35vIguWlVDo0QQJql3tDOuFosB8BmWOp6zw=
X-Gm-Gg: AZFdTZdTA2uWBT0IyH9q8re5fBhLuob07rfA0Xr8SGwEGkg3k0AzxQ2K0LBxffhlcoE
	oPLUOQcZqdfWqAcaZg1yRTnEvfPyC5V9cBtWIUpnl4bQYuh5h3x0OefqHhcpqT15sQrWF1kU58o
	Yj7WRcIgiYcv3rApdrBC/bz/PFp51pJqrnveP2+Mz6ZlIGH4U0d559/8Hv6FP0Vgo+BMGhuHF48
	dG056y4FESIHABtMhCkqpRReY/BJbLkfrEm2TmwL4iqIUev6609cAURFLR/QzLkWCxSMSD08fOk
	ydm+mamd7ZkoaWVI0oi8WVlcHFfr963DDLSE4MSXVQZ7dDyMj+4onpOGaW+BJiARnRDnotL1+P6
	ZUOqGAtwEFh6HRNSPYDG+Rk/46HTPje82YKjv+tXtKr9kXaz/eRgshoi0IYUvJgwpwoLXzKTHFv
	WlfDqY8SryEZxqPFrTVkADixTnzQGmlt43j4zuGLYaYD8i+Rgg2BamH10HbQKjHBdYd0Wl9Okwr
	BGyEyhJGGzgiH1lKwRouji/EFHkYgclZEfZmIfH26+QiBKKh/oyrDb2hJ6YcNhbXnW48SFznogZ
	jLJmzI7yJCKLfpdo4R2y7Bx+ZV5SsUtb8ENTLQrd53k=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb888160c2mr325342815e9.15.1795541632819;
        Tue, 24 Nov 2026 09:33:52 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm410677815e9.4.2026.11.24.09.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:33:52 -0800 (PST)
Message-ID: <41204b50-d861-435c-9cbb-8155e5e1d771@linaro.org>
Date: Tue, 24 Nov 2026 17:33:51 +0000
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
Subject: Re: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 16:47, Loic Poulain wrote:
> The buffer address written by vfe_wm_update() has to be made visible to
> the hardware, and the way to do that depends on the generation, the older
> ones only expose a register update, some relies on a FIFO, while the newer
> ones expose a dedicated address update that triggers the latch on its own.
> 
> Both sequences are open-coded at every call site today, with the address
> update being additive and always followed by a register update. This
> leaves no way for a generation to tell that an address update alone is
> enough, or that no latching is needed at all.
> 
> Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
> it provides one and falls back to reg_update() otherwise.
> 
> The write master configuration programmed by vfe_wm_start() still needs
> committing, so vfe_enable_output_v2() now latches each initial buffer
> address inside the loop and issues a single register update afterwards.
> 
> Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
This is a bit too wordy for me.

Can you reduce this down to one paragraph. It seems like a 
straightforward functional decomposition to me.

---
bod
