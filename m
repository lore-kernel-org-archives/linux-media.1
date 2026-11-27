Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746442;
	b=1XowxFlKWByH567iFwJMDSwybRKGiA8cXjOT05hArd+vGG/2o7F1e8rieEVUzB3s20wG
	 AFCYH8MoDGmORPwp5Fw1RFAuLOFySKNL1SQ1sFaJp75m+7d/xTnI4aJyy2wNtJFwSwgb7
	 nx1FWMbBq0VGhY7RbytrUtzIVJLgWLYuwg7eZndEOjSPUlIfsNl0TZ25goAuYxiP3ry91
	 Lxwhm1yMRJA44QnwfdJiwi5tRXethenJ9QY21LFud6RXEcjQk+2mVWjuuhB7EmKydQBNJ
	 JqU20FWr+caS2v7yUgDEejF++qPMqJmsxZJ53IYETPyl80XhZ8NzSL9CU4/kfeEHtVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
	b=dI3fMeFICamV3Oq6qEvcrkROCb2kw9r7fGwCQPuXu3yg98WgA2YWmQY1/dCpvuCyr93U
	 nSg4X8Frpqt5WHj5Zpopaw6Nt/RFyn772cLPin4ELMJLS0YuchkhgIsKLzGBeoe3JTZ7H
	 0Y+Rf6Vn2838WRfMTQA99EueX7HXOpeyVCQTNYwNFrkeGspW1gwfXhgo8+JuOqouX13Qt
	 HYdF3KDK3cdKnr7OrJDgNnf0IUnuDc3PEDsGKdlcOJukv+UOJHVAoP2FiT2On1G9lPCtL
	 vnKnbfJGJcFtJTKjWFvN0bY3RO1RKxoMIYNCNaFXMpGkU/SJXd6F1ouMjkOV7UO/u+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0AnO2nFj;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F84606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 02:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0AnO2nFj
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4311432a91.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 18:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746441; x=1796351241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
        b=0AnO2nFjocMs97/H4Jy1ZdrERBynQBka7/uV33w3HI/HSsWxdCxOoXTXOd8jdWIYCK
         MDR2rji/EwLvqis+3SQmD2ljHQvy69WJD9Fn2gWJR8T+YNOu4M2FaEtqGuXjoCuVBvrW
         SuLkMvoDl6n+qnQT6PEdvEsYL3WfMYcKp9iKQ0xq5k+ntv5xYDEhHQdLzQH8HPA06qTX
         5JLunRoKBBh31y2fsVSpaOo3hlJZtVJF4O5usYsfuou5k028Yy1Uv4yUmQBC0MIKeTAE
         Ia5zrlFxcLpWq+uLXXNcdhuU5nPMLjz3jwtA7e27APFtQCr7HhbY2BPfydB2qd7bCjfm
         Fjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746441; x=1796351241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
        b=gMW0qbklusybO9VObmACDdVjW3Bdc7eybPRoPhLMtMVkzDiEGkFff9SFkx3rXD7MpS
         0dc6E9Lhbq2jZDZZvLarZshGPTyjj2QEwkq6lNMyB7IZtbxM8nKxyI7s9j8JOl1gBuMb
         2AGEj+KzPtYYg+GJYsfv6DewZLqIHFiKrLrwbYrqWhHV49lH7LKeEfFAWAZsl+KSSuj4
         ACqnBRpJYEfTuLLo2oP6JCykm0s8fdbQVHnn6tzMZd9v6kBggjSpY9+TFWiL7xZtXqoy
         L/8nNFY55lLsg/JX//wcKq+UXHE2sYuSJSsj1Jz3NCFy8gl6XRJmzF1d301hTIiiRS8B
         njtA==
X-Forwarded-Encrypted: i=1; AL+hErGjngGYX222ANyu36XbWGlk/cqw1HXKeMwrBnvd445STKK0S4ZPCYo+FRluGJZkA7rIGDUeDv2mIYuGGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tq3zJwoLLLpfr8xFqdNIQu65pRqSOESXxn6MBWUYTnELrQAxu
	c93uPrkHgS3hlU9kjr6G3u4GII20AxUj8pputuad8YPlrgWMuu4XMrsH
X-Gm-Gg: AZFdTZfwOwRl3ZKcKX7TuM4Nfx2utzHPkf1aq8GHOxsuzdnx+e1AYCCWnkhQo2PXTsp
	2j1JzQIk1zmONIvDgmjyoeW2RLac3LD2k8XncJ5RCsnSbOI8/BExhrvMYJQcxiUVXS6dKFYYq+q
	HzQb0VgK2Pi6Cq9i8eIaj7WVwV9LV400/wkkpO/ihmobgCBoMwiQjZjCN0FK63m8XE5LK0bIzbV
	kizyT9Wx9Y7FOZsFqBNCJnbgM3NRI2b4+Uaq3iASroCZAN0I7+qsFyicTxMwDuaT74TM7oot9Pr
	su6IGjE6vwRALH7qkIKGE+lOD97AmFgZGrHN3+sh11D8VCqdBc/NMgW1D70jax+w3BVRaXTw93P
	ZRujTIyKu50qMnsHWPk+WiNKpSA1RGHkB9a4x5PArXyXY5iwH5F1kZWOGq2QCnE3F2/ztVUsHMn
	dDCTthzOWDtPri3GNlfIsX8CAMQz1/ICaGIZY8uyq1TWdY3TXN/rmdz7UrrhUx9fXTq35suonMm
	yf8aEMykwLTN+HPyK1UG+VNbUApqdrBkTBnx9qCwoUIxSKdqiJaDYtbhZudLZuwNPwkFRz15197
	ippoRONksyHFTypSWKu4dpotX4nVBYl1VF/eMK/L/oy8Q1nTtptotRvw90pj4PgmGLokB7/8Q3n
	xLGL1Hq8=
X-Received: by 2002:a17:90b:2416:b0:3b4:a6ab:b846 with SMTP id 98e67ed59e1d1-3b4a6abb9e0mr6418713a91.17.1795746440731;
        Thu, 26 Nov 2026 18:27:20 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm37142870a91.3.2026.11.26.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:20 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pispbe: check configuration buffer CPU mappings
Date: Fri, 27 Nov 2026 10:27:16 +0800
Message-ID: <20261127022717.685080-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
References: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 20:52:24 +0800, Slavin Liu wrote:
> Reject the buffer with -ENOMEM before copying or validating the
> configuration if no CPU mapping is available.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be fixes, by rebuilding the
pisp_be module.

Queueing MMAP buffers on the config node still goes through the copy
and pisp_be_validate_config() as before (an all-zero config is rejected
with -EIO, same as without the patch), and v4l2-compliance -m on the
pispbe media device passes 400/400. I couldn't make vb2_plane_vaddr()
return NULL here, so the new check itself isn't exercised.

Tested-by: Roy <rongh7426@gmail.com>
