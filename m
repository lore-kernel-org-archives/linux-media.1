Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719647;
	b=QaPX85xw6zs+9xpxMyPiVgmz/gWbkq+3XXD6pP0FJTL07Ak02uglFHJVw/rBy6lS35ct
	 apdRHgYT4bIZxGh6I3SSdGj0l68yipFbuu50cvOPFyU7zYEfbogwwwOG6s6RExtcWPezm
	 6sfUuQ6mLz4vobWbM8XzrSehUoJvqvymqkwJp1JGa4K5zgZomp3VnK8F4Z9HBvYiMgN6R
	 1ia+rXgr3rVYKmMQvIwrnp1f8ZwA34mIW6kJFBrEDeM1lalNFFFxHcy6ve6uqHSpE7o5x
	 x4l572NoQ2S6abQ8yCkYxAuDQwLIt4Ry7zkhhDwVBpFaqwQbKuRIAyICfP+SrBWv6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TefUIXXlEMj5cJFFQ7uazOLXteD1gLPFTJrdl5Us/To=;
	b=X1mEzaNYyO69ieUmGwf1hqmAtLsCClxLow2FluLOLgTnO0juP1IAtE9up4tRQ0yTcLMx
	 JAyGN+luWc48bHuoQvIHd3zim1wzimjfrIzRmuUYAvvRztJpBoU0Sv46uoZBBQ74rJ9PV
	 eTBoma+QQvz+DtrQpHmQThpgKQ9LY5A7UeGcZyS2E0DZn5xiL8xBmLWXSTppvL0LQdywC
	 tc+aGXUcARkFCO0tmWdHe3TZkj+EU2TANK0p902Kpwy9fzfsrxi6xVJVTt59YRhBXjkl8
	 wfOq5LPoIxjRHOqT2p4Jj6tD/mRDwIcRomM4eM10wBrjOiblFD+CUqwSdbHsWyFMOng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+6z3ZBL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C81C606A327
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C81C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+6z3ZBL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso17852145e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793719645; x=1794324445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TefUIXXlEMj5cJFFQ7uazOLXteD1gLPFTJrdl5Us/To=;
        b=V+6z3ZBLKk82QKKtTa6ihXRrYIm3LM3PrY0Za1A4R4W1/EcMtKYB1U1s3+59MrOxYc
         uRplbE9bqrWlFz4UhTKmuTXApu3+8rtVrywH0mjD8otCSaT34BkUI8a6TGEDmhClGf92
         SWj4d41oojfr3oPKLa59ylMfiZmEIv+S6SL4T8drMDhZgaAl65vqCRS5rHcO0qzysTnG
         xeL9KHuZhnm/APUS+g6hFVN4rICM++ouQpbuwhzoIQ8enoL3xfpq917r5938aIW7SCxK
         SfMvPygU90r2MqszREvjU6JF9UPVS1zPY76BqPxWOfeqfttuj0zXB+sNICY1HoFqpuSe
         0NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719645; x=1794324445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TefUIXXlEMj5cJFFQ7uazOLXteD1gLPFTJrdl5Us/To=;
        b=G9Wq0ZTV1XA8BZkbV5qmxj7AU/uPy6Qv5wtbWst0heEN3F8MOmPnFE7ltAaQhzKQfz
         nnLdhRGVl2PPdyX9Cn7RoXWshaQ3JnS4e3I4FCD17NMxzaFP1Y2+ktk3BzEODRaSJC5H
         a/CaUXLlCdE8y3mvQGLoyTgpEKsQe5W2+scM9yLRQjFtvRpKwuOENIuPgrDgzGLUi09O
         qmrhnvA4yV+GLQ6Z2PQH3sqOdkhvcxKF8BIz2DC6zwKw0Yoa7pz5EPEppgrnVgU9e1fN
         NYvWgZqV7IEuuENqK0Boxgp8pfY7AUJsIabu8WX08xnYQUWKWlhkNhIcdCC31Ye1faTs
         4bBw==
X-Forwarded-Encrypted: i=1; AKwUvByP3oh0KMXssNwjxtFcWLQW+MbydsFe7ZIPeyElhs/uG110Fo7+AtY94OTchzNR6lLrFFMPDS4pjTU44w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YuyaNnUhJs4I4maH3A7myn3lysFMW6KTgpZ3WtX8xYAgg4/W5
	yxJ1K2EieaGrjkMKgl14lMJ1TmN3suHLMrWNN/zTfWCuG1EOVkoNzhEj
X-Gm-Gg: AYBFou3gqtmY3g8NZ9Zv2ljzE/ucpyKFpDR7q8IlnpVQl1/i6B0EStT11sM9DoYNWqg
	9nxGTCNlfRt7AMxHthXDjH/VjciaE3kDHKQIU8ALSM2AQ6O/PPtBPayWVMqmqjWvIIdapfmTIaf
	6Lj3KRAcBY0egZwzahKicrmPhOMLePhl+61Ep1qzu+ThvwyPHPnfW1EaiDBcmhpF5+/R6lpAxDG
	QsxR9X2sZpV4i+wTVV3Fr5Gnjn9+rrZIyObbiU24pGhK6WVC1iw4qqhB20UXS+kSTzJAJiM9TjQ
	uHWFdb7FJwrgLnXwEGIzhEqw8iqIRX0wDNIh0VEYDBhOFa8GEkeySjJ/MfmQJZvthWqFs97/2e2
	+TUc+Fg5yUhFfAhGTCPKUG/5ZOL4zUoWN+387CIEQOm8wnu99cmvC5htRUH7yfv6nrZQ7K8Q8ul
	vXYVMo5eXwXj+/jU7N1fwgTQIANNM2cB8FbTCbvX/m4myaMek4FLdOGyU8buwUrZvD3Xkn9oAOB
	AghbYnAVQOCip25oivuiqSWP0A0T9WxBJJg9ZLf/KRa1MeT4FDj3JkyrYQAJ4V1YCZ2rMIuAc3F
	lEcgoNPjAIAW3SHBP7I/AJn6mS006yw/TVJNQCWoS7OjN8ucEHSpdqARsWZPa9xk6k3bYFWL
X-Received: by 2002:a05:600c:a293:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ac17d19a54mr202178165e9.2.1793719644922;
        Tue, 03 Nov 2026 07:27:24 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:87e0:1189:3df6:ff07])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm60171945e9.7.2026.11.03.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:27:24 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Caspar Adriani <caspar.adriani@proton.me>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Yifei Gao <gyf161023@gmail.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: Re: [PATCH] media: amd: isp4: fix self-deadlock in isp4sd_start_stream() error path
Date: Tue,  3 Nov 2026 18:27:07 +0300
Message-ID: <20261103152707.90152-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-isp4-start-stream-deadlock-v1-1-babd80273148@proton.me>
References: <20261028-isp4-start-stream-deadlock-v1-1-babd80273148@proton.me>
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

Tested on an ASUS ROG Flow Z13 (GZ302EA) with v7.2.10 and an
out-of-tree setup in which the OV13B10 streams (NV12 1920x1080), with
this patch applied on top of my two isp4 fixes [1]:

- stream with the format set: 90 frames;
- stop, then stream again without setting the format: VIDIOC_STREAMON
  returns -EINVAL after "fail to get out prop" and "fail to setup
  output", v4l2-ctl exits and no task is left blocked;
- stream with the format set again: 90 frames.

No hung task, oops or WARN in the kernel log. I did not run the
sequence without the patch on this setup.

Tested-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>

[1] https://lore.kernel.org/all/20261026182442.229869-1-saif.elden.hatim@gmail.com/

Regards,
Seifelden
