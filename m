Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822928;
	b=DqGqnByN2LsrB5MQr7PjhGcLeDVzctbwEixc7HR6vJJ8lb16EZq8lsa6SrSfwhqpAr30
	 cDsxOLB/rr3GzE4SIivw/qDNrM7FBUUrxErOJENgeK3QA5MA8NpdstWKaNHG/s5Gd7EOy
	 NegpCHY8Y4xDlCKMReSjPiuGS6na9L0hhkQNhl+v9DXWp0UUPst5gpOGv9/nUn4fHP9wM
	 igYleM2vPo4P6j3r92K5A1HRlAA0nEq3E2+5iHszSp1ZSkfu+J44SoOwSR9vn0rJvzM2o
	 SCZZrvTtNDiEuSJNPV9vMTA1eBvzhKHoiuX4h9e4KJhHStTf0m0o0QmF+eUCk61lKYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822928;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=mqsgecR7PqnKZ+BistIBVBvlZgZqI1OMCwkWI4zhdVM=;
	b=U5ZDUwIAkx5mae6hebWWw5sR/WnHgr0pj5uRMcm1mm0OU/CiA4h4MlrOk/6ND3tZGiYk
	 k0Pzzis3+6eswFGRFEmtuUhpGlBXopE8iHAVNZ7ypG+N1cdKA5xkyX7YlUiYLwX3iDu7t
	 4qpiureytEeaicpqXMYnwf32CL6CANvAFJOf2InOsWMokeKJpQXGC3LGYBm+F8VfH/XSd
	 o4j6ruQENcJvu5P5dT++oCj3eJcDJ8XFXq95+0Ihs/wmc9YBg2CxiZcUJAQs2RRqh8Fa2
	 6yqroLKWDl+Ud6g28CGu4FPowYuNLxtOHKFUJUlEq8hcRQXSEf/ACPDkLIrrr2x4lIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Kxl56kYC;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D89606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 23:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Kxl56kYC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=mqsgecR7PqnKZ+BistIBVBvlZgZqI1OMCwkWI4zhdVM=;
	b=Kxl56kYCm+Ih6QbjDPV2JZvJOYNAUwL0+k09ocKWVMDGCvsHmb1gma5qjdqdjl
	XgJ6sCVW3muRrLYnDirmTvFnZS/tR1DTzNbx7pgW2a3w4BxhthU+Fdch2yulz7G3
	kPBaxzNr4+j0nWdccXMzOBkryKDswwwzNoENuURp+boHQ=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnb+YUFQprOPgvKQ--.24533S2;
	Sat, 28 Nov 2026 07:41:09 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev
Cc: Jiaqi Shi <shijiaqi_develop@163.com>,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sat, 28 Nov 2026 07:41:07 +0800
Message-ID: <20261127234108.641406-1-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <479b6df1-3cd7-4609-b197-86bd937b1fdd@kernel.org>
References: <20261122114205.494704-1-shijiaqi_develop@163.com> <479b6df1-3cd7-4609-b197-86bd937b1fdd@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnb+YUFQprOPgvKQ--.24533S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1rZFW5Ww47KFW3ur1kGrg_yoWfZrb_Zr
	1kC3Z7Aw4DGFWfAa17Jay0vasxWFZ2k34jvwnxJ343tFWjqrWrGFWvqr4rAr1fZ3s8Arnr
	Gwsagw1Y9wnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbjXdUUUUUU==
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzRWn+msKFRU3BgAA3V

Hi Hans,

On Wed, Nov 25, 2026 at 12:00:52PM +0100, Hans Verkuil wrote:
> In any case, don't move it to the core.

Agreed, I'll drop the FIM export patch. For context, it was driven by the
first item in drivers/staging/media/imx/TODO:

  - The Frame Interval Monitor could be exported to v4l2-core for
    general use.

Since you don't want it in the core, that TODO item should probably be
updated or removed, otherwise the next person will try the same thing.

On the FIM itself: I'm not aware of a documented userspace use-case for
these private controls and events, so if you'd rather remove it, I can do
that as a separate patch. It would only touch the imx FIM helper and the
CSI driver. Would you like me to do that?

The other patch in the series (removing legacy control inheritance and
source-dependent format handling) is independent of FIM and implements the
remaining TODO items. I'll resend it on its own.

Regards,
Jiaqi

