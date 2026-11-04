Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754465;
	b=DmC5rNe/8mD5yMybhSeCis6DIvJxhQkXBr9WnYIZu8Hje3OZZIJvHVSMaQOEjfu3Z28x
	 OJwziQiD35WqHD2UpV5VvACvHF9cpYGkZvJ3i+fWNfG6YN9MnrgUyGu+xn8PYL9/joLPN
	 ChoXceiL1ImPV95JT3tv9ywknU2lxF5PkOqh8dvNSdps50G44RZD8ztkv6woymLNleqza
	 dmYZjgSP60JzPg99xcj9rPzpR4bSdsYDLIeb4LalADpWaGm85vLoAUipsmZhRIGXPXihs
	 jmpbzrSpCH1XWAQ2BVlMGBWnQ3rdzOQSHxbz/uOVeuLudYzj4/atGJTp2p61IuI14uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IkoTUr12d3aBSwhfLu9j73ajMyz1vUUn+p4JbB9hc1c=;
	b=AiGM7QQ+belurALuiiFnAg+ZoyU0wxFE2V9MPZ4sf3d/Xq+F21foCv4O/6Og3aVPEffV
	 i3ce3YdIUBQqNo7VjM4VBHQ0Y4KgvMRxYmpkKr8DvMWRtoEAm4Oc7/4T37ZcjNJWaTX50
	 8h9zzRJ3ZmScbNEQX8rcCzl9dXlHoofPyf/KdjkHbWd1a2Hfz1/KZ0YDYY8uRd5CF/aeL
	 rVn+uz0+vDWl+L5lLiI2RyyehBrJYDfDpFjYtpcylxJZBV8NsoZyU4u6uXT3IvWK/RW5E
	 30Qd6Ri6JTfXwgQQ1bh+e08UJpdK3ui1QFvUmjLi74367uf06C5tTFpd80/92tkLrcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x74JWfN5;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE7606A32C
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 01:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17DE7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x74JWfN5
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so533305e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 17:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793754463; x=1794359263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkoTUr12d3aBSwhfLu9j73ajMyz1vUUn+p4JbB9hc1c=;
        b=x74JWfN5h8ikXShPfz4EZ8TGJByCm/kix2rdXXQg+GWssuw/Jmx8f+11kO1OJKvkQx
         P6ptJKKG3pnuMuTPYPcUvf1vPG25sSvkhfc4LHjL9sVd1CfzGwxcVL5dcm/LvNH2jPOL
         /AmWRtRIk6qpwVompzpiz+IrXvZnsuZmuCwNb0pk6Qy8S5ozLPrPqFYDC967eEUffyHu
         TMGNHaORHxAaDKrpKfY1cTVaY3znb8Q4iEu/WK/SdK0X2Q87qsT6/fNNLkq0dyJVJDO2
         HW1tUYmxA9m/cy3GF94xTfSR2hUQYr+M/OuLs19JAv21wQZ/wtY2qI6cL5BGRn5xqyAZ
         tVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754463; x=1794359263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkoTUr12d3aBSwhfLu9j73ajMyz1vUUn+p4JbB9hc1c=;
        b=w1AGVqO6R8hnqMo73jY4DA5qMmea5Lh6mvjyCXLlyx1lYoNlZXtKW8eRGdfCBzac3P
         zEc4bIDQ+9iAzIBFTAVNqKUXyHtZBOEkPMk6HVitTFI0nHhiLVcilXg/VcwIG/skLnmH
         c4segVrTovjokt7VHTOQvreHT75jW1b+Js/8PthymbQ246Yb0qyGwjD2gkm6zIIHw6C+
         1c5lxXboZbEqBAf8OqIX4W90Sq5GfVMcUz3qbc5jFwucfYFjz2s6FgxoRcsmzYbp+24C
         SVs+NzhD1NMvZkx/Nfqdrkb/oQKsDpqoaob+Wqk76vIs/09L7J+Iw8Lr3IFk6YtOmubD
         JDtg==
X-Forwarded-Encrypted: i=1; AKwUvBx5dQTiy8C1VizfMTOpQaCmySJWJX2SMNWe62vE07wcvDuh0RYzpXBC88wSGUk/Jx2VZA/AZg68lG/KiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Xsmqeb5GAOjv5As4PAUs8Djllg7o+osXn9kBNOygAGD81vWA
	bYsfHzDJxpwEfoFrbwzk4VfswoykqDNIKXmqq0H9bT+ydg4gIjW6e5jOfK1GVw==
X-Gm-Gg: AYBFou0ysxerMRbDFnYq0XJmkpSxLqjCzd4X/pBarY2hRAksvsu9g91etcEsWzws2QX
	pNzi2zUPVtiEkB1ByByA6cSUUlWPd4t41hjzDjzGTAEgn75+rj5JF8B3NZ2bUnz52riOpwQRpnB
	0Yb/z5imOKiGXOR1+nUQ8276GJYnbpP5OkDYoRkaUxdbF3izIqdXHHXj23Iy7H/131GYqhtdLM5
	myKuMRR2BYSDtIoy8piWVZAQbSXBij/spH/kU4IoGefi6Bj6E/rcie5qs5HSMO/wpHRZ7PN72vv
	nOOPjUJPO5wn0LEUb9VDncVIzi5KT3Vx1vu3jm+zsNSKVo3kC7HJ4GiZLDfz0Et+SRhnJskKuJk
	eMqaLJreAsOgZe6y83rzzmpQhakiqZFnAD+Gm2vxU9xMc75gl4XTnoIwh7Mi6RFKEPYsP3V7PWC
	z16sPKoKtUS7nBGLH2OxT2kQu6mXA+VrahhhEKlKu+mbeXZVy2RHrJvEdoPCVJuHRfrxMYBa7XW
	xc4pr8cjakzKjQdwi06ROdE3fk2+cZCTNdOjjLv76Ufa71DH/NEMXwTFXtg4fi+V6QWGsxW4Q2W
	R+l83cPHP+DHPiDhXsCfzoQ7kqSxdHZtmcPD1z/NgTrMFls8L310K+yievgpT4IgtJjKhiaCwkO
	JZ3pM+AtThDoNpvhFq9Mu8U/tBLtoXApKTRvR1B71BBY6MxYyNsC620sYBIC0ZuvpPu+EZ2jwHJ
	EBBQ==
X-Received: by 2002:a05:600c:4f0f:b0:4b3:ad9d:e21 with SMTP id 5b1f17b1804b1-4b3ad9d0e48mr50657685e9.12.1793754463523;
        Tue, 03 Nov 2026 17:07:43 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm181749615e9.14.2026.11.03.17.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 17:07:37 -0800 (PST)
Message-ID: <50be53a4-0136-4c8e-97bc-2cdc1caf76fd@gmail.com>
Date: Wed, 4 Nov 2026 01:07:35 +0000
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
Subject: Re: [PATCH 0/5] allow dma-buf-io ctx reuse across files
To: linux-block@vger.kernel.org, io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Nitesh Shetty <nj.shetty@samsung.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 00:18, Pavel Begunkov wrote:
> Currently, dma-buf maps can only be used by the file they were
> registered with. This means that we can't open a new file, even if it
> comes from the same subsystem and point to the same block device and
> use it with an old dma-buf registration. That would be too restrictive
> for upcoming filsystem support, so lift it now and allow reusing
> contexts between files pointing to the same NVMe, even if they refer
> to different partitions.
> 
> To do that, we add a tag representing for each file, save it from
> the file passed during registration and use it to reject files
> which tags don't match it. Tags are set by subsystems creating
> files, should be unique and represent the instance of the
> subsystem.

Fwiw, sashiko raised good points, I'll need to address
them in v2.

-- 
Pavel Begunkov

