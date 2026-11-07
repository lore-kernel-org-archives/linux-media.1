Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061083;
	b=Bu3XH8XfyJzAuayAoQu+b4IfbDDGud12suMmWskos+j1//oW1s/FQGMIzgmCYo4Noo8y
	 OkrDiQKhySl7lmhLPLrvp+PVGrRt2yhlsQoGLt4B0Tz8HwmiJzZCN3LLzSxm/LrepODPH
	 bW8Q5DD1AKNHZ5QsFJxmXGeyqro4s2wHycypROfeatdh3cwORon2aKQxhsT0wjoBonkDJ
	 AkxoksCM11MlWw/DR6ErM/yRaVJlpeJfSNhs3Jx6tfwUUkh64+Dh+S/aTDcA3Q/IHq3sF
	 INFI/che6JOAjtOw/XwJRmHZzHIpKUxdHOW6JdTPxe/ZhU00nCg5K9XV2IlmS+wuHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
	b=lAv64MI6mLd0EFY3tzS2nnRInvkq06xIf5bCOIAdQPHLXgp3cuJRrqIKsSaC6+nCvOyu
	 NrcTxusyCV2qJsd2FP3SPtCF5ZwkjHKZRGRhGiW+cdnDCJi+cV4bL+ummfGryVttUu/ib
	 tSH3d7pXnFqNyv5LdYtbYc/MNcKuKkXAkbpDZmwnk/3KAdLvHbAHEqTIq71JVaGHxhR60
	 mDVoSdNZcks1IQRIVCGaj5UPCTqIWRcU8ONjmh0eCkP58ITWQP+MidtNv392qBEO+A0Dz
	 Wh5PKvFvAwu7FWOpHafrDQObiNQ916ka5CzDLQk+b48oe4umLgoUJjEgKX6Ri2EsT3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRKJMeNk;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5952608361C
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 14:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5952608361C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRKJMeNk
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so3152842eec.1
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061082; x=1794665882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=vRKJMeNkeYTvBGviD6I87j8Oy+rPbFlUb52I64IClyQsWkjEB5fZLuDzsYvW7iObbR
         GYEenh1eZQOwcd9e+Km0yBbUYS8upsjVAp/uHrp9DzQUCUxe0/RJ6sLbHtyr54ETYsod
         X+7wTcR/GQ82jkhUSdXSXa3QNoPk3Gtisy9D6RT+xuvqrvK6vaWLijZb1Y2stUIwTzVX
         ZcuTVjJq4d5I6yThJNvdyhAL+cMJV6UMRr4Xzftp6lyPsbsj+BMhOvTF2/SgZ6Y17gE4
         iuIv0ziNNHOdsxjhLbmerNIoYMOQOKfG7ySNHHC0hZXZh8sGDm1apSsuXi048t2ZqDNi
         rElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061082; x=1794665882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=rVSAPIeR8k69AuQtGksO8t7lALYImNo8/H0OwT3IuFmT4sSwclQ05jgTOdd/nUvAnR
         JaieL2VzZf4Q5cN4taoe8rddAuWro2JiKzTGyk1kQmbkCY/jUMaHkNiIS7C23LB2V9wU
         QiYccCmXN+t5OX0E8n2seF3hD+eaoyWz+WJCRQVfTD9SczXuIwMilZUYx5J4DnkO1yE9
         jDgnD0btlZKrMhFscnBIi+0BPYovDBNsK/LtSBZwtpHFQgO2cDinusSi5GTRcXfhDM3C
         2ErSvhPDU0kMMA+etiwEDMtQALcQVCJCZUk/xwCdPcu2GlEg9VvFdYbvihMJvk9X6D99
         ZGVA==
X-Forwarded-Encrypted: i=1; AL+hErFYYE5rtnc0Gk3VBIsWYKympQec54ptIBBjAwSJ1COqaJLdWKCMoLKaeWG+sDzVTSeBJNBTFSL03q/3bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IsdSfk9xb1pLIs91s3D6sF05SCY+Ezdb+6ORB689zWfBcTeBu
	10S1AE/+TZF4WHg+25bcxYFo9AW6bnGzDf9EY9ixjVIOjjBps9lk026w
X-Gm-Gg: AYBFou0SKMapKFitSe78qAxfmUln25UTHp5dfPuIvLRFQww+R8PLA+PQ8NOgz4nkJSp
	jWH3yVL6fMyaojT1ibULVMgpxD+241hVR0N3KzFk74B7yBNQGWX7h2smRAzOgdE7DikBOnotHK5
	hBnOO0EY+2QtGLv8d7nuJxQqCSKANa4hUBBzDe2eB6Ai9xeLTxJ4VQc5yiXRBn86YbCrueJO41K
	CVYBVzgoOLKobbfkOWuK8Nz2SngI/riX/S0mUGIGBEwrmYhd3aSFPHSty0hMKUrAcG7Fw1zy6wi
	NgRKgsumoXR1Dc5Gks2jwtnKhapwQQiQb+In6PLsqkHn4HNcjEyZK5YCDvffbFXIFf3bizFDjyc
	o+FeBRTJ6QrHHfFIvf3iB68wY4nMYn2sk87upeqJ3vd9reyF+Nt8PAznYwZKt4pfTXd3EJ1ZSbV
	xmh9/9geQgwF6RSuzQR4atqQyt0JEjxp7b51m3PE79jbYS5yUjBiiZMa0dvaWW4T/rGWMr9l/sP
	8rRhEtNNjQQXss/c5N1GbacGVxgj9Zpf+Wm9XAVUa46OonRhupaCSGkeB0/YCQaCDiqwI9QyWlu
	i3QoB0vFomY/BYKZKmmn3W0kHx3LNjVHsGcpXOrBMxhw6HTSN0/c49NnoPo=
X-Received: by 2002:a05:693c:87c7:10b0:36f:26a7:968e with SMTP id 5a478bee46e88-36f770062cfmr7560876eec.40.1794061081678;
        Sat, 07 Nov 2026 06:18:01 -0800 (PST)
Received: from TheRealOne ([2409:40e1:407:758:265f:d54e:2491:df90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm16251949eec.18.2026.11.07.06.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:18:00 -0800 (PST)
Date: Sat, 7 Nov 2026 19:47:51 +0530
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>, 
	elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
Message-ID: <au8s1_tIBa0mpTSL@TheRealOne>
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>
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
In-Reply-To: <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>

On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
> Here is what I see happening at the beginning of gb_connection_recv():
> - If the connection is disabled or offloaded, return immediately
> - If the size of the buffer (passed in as the "size" argument) is less
>   than the size of an operation message header, return
> - If the 16-bit size embedded in the message header is less than the
>   size of the buffer, return
> 
> In other words, after these checks, we know:
> 
>   sizeof(header) <= buffer size (size)       AND
>   buffer size (size) <= size encoded in the header (msg_size)
No, it does not verify this, it verify:
	size encoded in the header <= size (buffer size)
> 
> Therefore (transitive property), this is true:
> 
>   sizeof(header) <= size encoded in the header (msg_size)
So, the transitive property is not true.

I have sent a patch for this bug which verify the msg_size and header
separately, which fixes the out of bounds read.
patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

Hey please review the patch if there is something wrong or there are any
other way to fix the bug.

Thanks.
> 
> And it's not possible after these checks for this to be true:
> 
>     header.size < sizeof(struct gb_operation_msg_hdr)
> 
> or put another way:
> 
>     msg_size < sizeof(header)        cannot hold
> 
> 
> It surprises me this would be missed in the AI summary--and I
> fear I'm mistaken.  If I'm missing something or wrong about this,
> please feel free to say so.
> 
> 					-Alex
