Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473001;
	b=q1V/FUHov5hj+Bf8TPlFxsK3Ix6yA/UlIHNVrivMe/AArq+WsQ47jm0olgp5hne5laxr
	 q8UAL+CUnLP/DgmSB+/R1FD+PBBefnfWqtx6nwHS6VN3vgaiYjIIzafsRG6Q8LCgp4biw
	 mDqmiujLNr+14fQ5BN1DDt6oKPXPT9TzGpYaSgcubNqxvweQ9WbfmcuLvBB7vl35V+/78
	 OIvoG6Hf1o4LKpQ2k3C95hFKIa1RMTzKLTCCA1ZP81xF4OitbmeRNzDwLJ5+xF/xtwOxN
	 UP/MJc8J5oVGwsYhdjUywSDBpONAZ9LNZY1mGjo8RlfyunWFZh2tMax9vieU5H5Pw3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473001;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
	b=JpTY5TND/cJUuTiplraXayhmNVTdQrBRa4DE6d+isx7hEAxzZndMMJ+s9zreb/anralA
	 4cjxjlKnoxZmDybQBE3VDk5404DD7tYTeesbB5qtndg1nnPd7wXhGa6VIk1V6kqZx/llO
	 /i8I459JH4dyM54J5/V6EzniiX1M82VIk6+dQ4/Riyrc06Ni/YNKjhOne7QM5m5S/CMnM
	 /YHENxf6IRAOxg+gu2UTnpfcZgLo4ZfH1Soc1rfUMfxj0YIUi5MeobcfCbL8M+nJTKgzb
	 9/x0sB3tGkeBVHQBnbg44Z6V9kX6UhLvIWwpkdzvp9qgFMN2OEdrooWJgETe91IVyCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408E3606B246
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408E3606B246
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso38165175e9.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 00:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473000; x=1795077800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
        b=Smd19JmQUgaQUuqO65VFNUYGIA7LlTG+O9OrUmXbC51tzj0rweCT9FF7bn8ZPfJK4j
         dVBrit6nClWbnAQV478HBoGcTOFe1HXx4ZZg8i/WIWdxiR6XbTndxx3FhffmiwvPcSn4
         XOKuCOoE17b7+KqwUGGWq+mKFbel9KKYsrXsF+ksKr3AvTbtaYsWk7I/iSrKwgmn89tn
         elT4HzkaxfCd37LnN/AD/Jvvgnrt+0N4Sf15dYoWRMTGpKIXw13HJiP4/53YLpHAxciH
         WA6in8RBPzvqH7e/KUi4kGdqB8OfU1iInvNRSXqqfKz1peLb632vWFaDswK9dEqm7GPk
         2PXw==
X-Forwarded-Encrypted: i=1; AL+hErHiWKcH4NtGqf3zZRtidBBkSfFh3GIz/texj3AZX/I4kG0bM5WO7tbxV1iZPZ1hVPGuQAAuhW6VxySHkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9AjOnvTRaUoha3lxqu7cVKs043bWpww9PmoWFkdLH2Z9bdPKI+
	FX7y0r1p5zWYeoY8RAXAOMjfb8ZjDJvGczMvn3VG/Xbnd1fbJiYNxFdG
X-Gm-Gg: AYBFou0ljDiif6SW421k1Acb7zDwVJ/HXHWVGDzX4JzViuQz6v3SXJHJbPQ9ge/BXbi
	eSo1iMWQlUSDuTe6Ckn7bBANB+b6APQrzItwSMWNqdSFuXOfmXqOGFlgTYYD2v02fdVvQzDoVJ/
	+Gp3x86kLv+8G29ixd4jRtb4toSJpZhF3eW5U5HPET0u7YYAUw24MHj96lAfZ9pmXNZLHzoUe5n
	JmKQcmEk5h1HXOAZbCl/tcIbzErKdPQMaefYSNd8913pbQUjAg39Lz3QFBTlx8AFuyIsG2HVXUJ
	J3Uiq1yuL3A3GWtNPafGipf6wFhBHiu9XSEhC9xHmF3sA4yHKQqo80SQVxkRHS3onwPa4VD7hXg
	H0yJkpxbxr9nxmNnIHX+dq/kNvxTe1C4QA88W9SXU5MelH285N4V1Rf07jCryW1KzB2UYV9FCPG
	7oAwI5TZEJD6TfAUXuUjGZkOnil8DYQ0v5DojNKbXGHRO2q8F5sIEk42kAHjf+92E85XLUjtibc
	CxCvfoqUDCoUwNxWo8tcG1MI2Pa/1tqyo7k+fpZ/WQOhsXlO1hFO9B9HexYUT0/T9dbUdsUEasQ
	NdBEOJi+QahXn38ThsvlOo2bI2cJtz4HBY6j6kq2nyEeYn3VgbOwKGvpCNhofEwP+C7Jm7he+pJ
	VeSPrfRNSQv/JjpTG0/S36R+yiD7/YgOY2f4lMtv21VC900OUm7B3UcW6AyL4pXDBdIJJmoBuut
	qnF3FLjg==
X-Received: by 2002:a05:600c:470d:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4ba093805b3mr88234605e9.20.1794472999607;
        Thu, 12 Nov 2026 00:43:19 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e258e8dsm82532545e9.4.2026.11.12.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:43:18 -0800 (PST)
Date: Thu, 12 Nov 2026 11:43:15 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	johan@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] greybus: verify the received message size covers the
 message header
Message-ID: <avV8I97uZJgX8Osk@stanley.mountain>
References: <6af55517.a0c627da.5d811.0010.GAE@google.com>
 <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 08:22:29AM +0000, Shunbo Shi wrote:
> In gb_connection_recv(), the size of the received data is checked
> against sizeof(struct gb_operation_msg_hdr) and against the message
> size encoded in the header (msg_size), but msg_size itself is never
> checked against the header size.
> 
> If a peer sends a message whose header claims a size smaller than
> the header itself (e.g. header.size == 3), the two existing checks
> both pass (size >= sizeof(header) and size >= msg_size), and the
> message is dispatched with the undersized msg_size.
> 
> In gb_operation_create_incoming(), this leads to an unsigned
> integer underflow in:
> 
> 	request_size = size - sizeof(struct gb_operation_msg_hdr);
> 
> The underflowed request_size then wraps back around in
> gb_operation_message_alloc():
> 
> 	message_size = payload_size + sizeof(*header);
> 
> causing kzalloc() to allocate a buffer that is too small to hold
> the message header.  When the response is later prepared in
> gb_operation_response_alloc(), reading
> request_header->operation_id reads past the end of the undersized
> allocation, triggering a KASAN slab-out-of-bounds report.  When
> header.size is zero, kzalloc(0) returns ZERO_SIZE_PTR and the
> same read dereferences an invalid address.
> 
> Verify msg_size >= sizeof(header) in gb_connection_recv() so that
> the "Caller has made sure we at least have a message header"
> assumption in gb_operation_create_incoming() actually holds.
> 
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/greybus/operation.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..da53c0e026f0 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,6 +1047,13 @@ void gb_connection_recv(struct gb_connection *connection,
>  	/* Use memcpy as data may be unaligned */
>  	memcpy(&header, data, sizeof(header));
>  	msg_size = le16_to_cpu(header.size);
> +	if (msg_size < sizeof(header)) {
> +		dev_err_ratelimited(dev,
> +				    "%s: invalid message header size (%zu < %zu)\n",
> +				    connection->name, msg_size,
> +				    sizeof(header));
> +		return;
> +	}
>  	if (size < msg_size) {

Combine the conditions:

	if (msg_size < sizeof(header) || msg_size > size) {

regards,
dan carpenter

>  		dev_err_ratelimited(dev,
>  				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> -- 
> 2.53.0
> 
> 
> 
