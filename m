Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234516;
	b=I2WudJr9TunKyg0LeXtvyiijSwwnMblnGCTZs6fWs59h+jRUyNCcF9tx+YBCcY/uF8GJ
	 O41FF+8dwgDWFeQefgHWSybadmte42w9TjVEpWOb8/OV17qd4rEwVZ9opAW3nFfcLb4sl
	 hbtfZcrnA2gH8HHh9mtnLiyJjC3If0UxFGrkFFu/oCCS+3Ht4CqqjYVFkyIQUbfLNGS2r
	 jkTcvnswA9fwoiTuQRWLHZEiNGeTYV69fW8ycs8BNeY6R8A8OHSl+sF9xMiXO/xluA4Ds
	 pTs06pgogotHHBRHLrqZ9jQwBJGeqmA3y1k9D54ODeH3A49U+2NjQOI350ZvqmX7L2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
	b=ZSlblrtUe2s1QlXmx65Dppc8rNR/2Qq8kmBFOj+a+Rij+5EtCAXuiE09FamHZk7stnZq
	 V2Ym5X3iYM89kusC9498HNg1EDyHB4wSI8/FK+Mgv3N2jcwgyw8dfBUvvD/FdF/z364I6
	 nH2uhOVhlKNr8pHdwRbRCJALh686r1Wvh2NcJ9RBgVvA2ufwifYknOM3MXsI3slqwiLaR
	 MUaav5tbcoaIFZcA+GDueVJOb7nzj77UBi9L2r1h9KrAF6BYKW2LafVuEv/fYqpPBT9GU
	 gGTbasTq999KgjYzhoszff4+sPHk6njC2R7mUVxPhCW1muk6TTrRy0tu/rOmE47ajdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QToSrRLd;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E045A606D80A
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 14:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E045A606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QToSrRLd
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53656465d1dso410184b6e.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794234515; x=1794839315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=QToSrRLd4t7HkK/8/o4zJPpEAuQS72r5AsdEqGxsfs3VQep2BS+ODfK/0F7W3Z1rc/
         tBbwNxS+IXjBBrpvsaLMbhTj+SAFf8+iPVMYOibtHJhgTg9dnW3tuVGfbA6BgqcFUscx
         84KtGfnFSdWbppCe9hBZzzxNj7c/tdZTvLFdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234515; x=1794839315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=jtm9h0KOA8Hzi4DjonymNgtfpNExWvxcLNqIqDfGJ8SScfsnRSnkhO2TQJP85R1kg8
         yF2YpCcqPFZ4Gf4I0T5bunIxaNZl/EopoNmCp8rIBxqZWjopT8MsLVYhOj9pmsTblYtc
         41Eosh4+5cgV9SH/U7DSRZC2y4N5uxU+bUc9qbLAHjhUN4KcOTaRYGqRWgZQR+cKDWd0
         0235J0ZtYPcciKabiAlB3YMsDwFPA6Yp7J9aK8kP6F42VDAMuP8nEOdv3UJT3a2am2JD
         Hi9Hg6wA76ySwRg6duquZbch5RRfDTggwrMaBm4hVScPG+PFGaVVnqdofB1Z2tjwwhnr
         WqLg==
X-Forwarded-Encrypted: i=1; AL+hErFVLTHcsKaQ2AYxMWehHamOrI5ycMYCvLoGAINxEm86Pg8Ls8lxo2+0EKr32T+6pXWWrO8N8ykRHNCjqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8F5/IP9BKDWOh5BtQ91WeS83R9gLKIXw0DeHzpjnqSS6gFXS4l
	mtkbsdu4HPWAvoFSdqs2ziJ4yUGEWAELDzLflAhBj0/KTc7ex2tsbwVCyYzDFM97Tg==
X-Gm-Gg: AYBFou18E34aeVF68wdi5Cp+mcpBrQEbU72lb8oOR/9bbOX1aMSinSDgkithGGEBAFZ
	6qtaLQ5wqOJpjn0TduNEcBf/ZkBJ5IPyxMIipJqCQi+LWWfhsO4VUmqEyPPP/JcdpgII/42amM8
	W+c0k4VilDcz2DWr733NXZN18O/GpFkUJYrh3UR47w8bjfPEhk+nbKmeRdjL8oMUqDPQrIXa8J8
	2uyjmgPD2y5vGzGWnrv3K0LiYRRNKlAOkfieub/NR37/qVoU8SSE8fwB8sIW68kEk0DpSDPf1Vf
	cOkHgStT0dQgdgE0SmfubXcxJcITYIi4tMEBZ08Db/al3UkeY6sHw9EN1zh6VkSSJ5rsgyojGll
	RxJcp6HgMDk9npv1xGbQbGdj9VF4SPgo6+0dtIFKnMZ6OjKNA1DVlU7pmZbu8m6OQjhnOIni4wc
	YPy3JQraGXM2YdYgO9Lt5CXQ7e8OeByUUwyp2J6UAZXWOlPfkfIL+YBK3Yzedf2lXnzL2BWr9G/
	5+iqnAzV6BVgQsNZcuNgB2TgwqB99koqOdWLSZVYfbjndGUAdwxHmJPLs+qGTirrV0SlKIwQU0Z
	xuGoi3+bKtb0Jzmii1lRuIie/IfFx4nbeHdw68p28sPP
X-Received: by 2002:a05:6808:1495:b0:4fc:3dc7:66af with SMTP id 5614622812f47-5681432edb1mr2821350b6e.10.1794234514790;
        Mon, 09 Nov 2026 06:28:34 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-56813e56700sm4463564b6e.17.2026.11.09.06.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:28:32 -0800 (PST)
Message-ID: <5a2b5e08-c33b-4513-8457-b8ac21563121@ieee.org>
Date: Mon, 9 Nov 2026 08:28:31 -0600
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
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
To: Chandradhar Kumar <chandradhar.2003@gmail.com>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org> <au8s1_tIBa0mpTSL@TheRealOne>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <au8s1_tIBa0mpTSL@TheRealOne>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 8:17 AM, Chandradhar Kumar wrote:
> On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
>> Here is what I see happening at the beginning of gb_connection_recv():
>> - If the connection is disabled or offloaded, return immediately
>> - If the size of the buffer (passed in as the "size" argument) is less
>>    than the size of an operation message header, return
>> - If the 16-bit size embedded in the message header is less than the
>>    size of the buffer, return
>>
>> In other words, after these checks, we know:
>>
>>    sizeof(header) <= buffer size (size)       AND
>>    buffer size (size) <= size encoded in the header (msg_size)
> No, it does not verify this, it verify:
> 	size encoded in the header <= size (buffer size)

You're right, I misread this.

We don't read the header unless size tells us the entire
message ("buffer size") is at least the size of the header.

And then we ensure the buffer contains the entire message
(whose msg_size is decoded from the header).

But if the size encoded in the message header is bogus
(and in particular, smaller than the header size) we
have a problem.

>> Therefore (transitive property), this is true:
>>
>>    sizeof(header) <= size encoded in the header (msg_size)
> So, the transitive property is not true.

Agreed.  Thanks for explaining where I was wrong.

> I have sent a patch for this bug which verify the msg_size and header
> separately, which fixes the out of bounds read.
> patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

					-Alex
> Hey please review the patch if there is something wrong or there are any
> other way to fix the bug.
> 
> Thanks.
>>
>> And it's not possible after these checks for this to be true:
>>
>>      header.size < sizeof(struct gb_operation_msg_hdr)
>>
>> or put another way:
>>
>>      msg_size < sizeof(header)        cannot hold
>>
>>
>> It surprises me this would be missed in the AI summary--and I
>> fear I'm mistaken.  If I'm missing something or wrong about this,
>> please feel free to say so.
>>
>> 					-Alex

