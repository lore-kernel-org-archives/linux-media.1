Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699114;
	b=cUG2mOaKHojMxg8+T/xYGXTPVDM8vnoU3tezCLdekrB6EJhPnEMVZAqlJ/TVtbzGtakm
	 Rq5ogzbIQrPdfchCX5ijeCGXDhQxl78RhHeWHGgiIlZ/PNZiOnfCakDd+235fONmUbiON
	 gxJfrTuvtlpQUoXtgZNrSt1hNmGpAtFMVPQXJwqqtQLKMtkcOPLJWeE0pUki6F/R7HRB8
	 u1yrvwnkXCqoidBWnQxcxcjVPiPVsd6OrzZGxt22IwRzcruRBZfzrSJOLtO9M5BxuijwJ
	 3zx1E3zLc4Dv0IscLOmzMHcWFFHnrxk9VJV5FtPblLaMCpqglOKGHo0XgysRnZH1A5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699114;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=TdL9/DLwEwmbIZFeG7DV1NSVGl4q1MyFCCEF8H1BFWw=;
	b=CaaEBcQH4LLmnLiAWhsaYU1U3T5rwRCfxpU/piH9o9LQ87U7EQRNpjPIDpp0ijdsFjRv
	 Ix/swPwaQZTuzCf9osgBnXmcE2jZ0g65SAekuSfOnA42Jt7XbXxPzTWts8EBOOU9St04y
	 IJXzB5lAN/MZkelol2Kd7pggVqxdJReFPHwlNOBiwnOyfYZVGy6FclOD6/pYHYh5LbBLh
	 HhSrK+3ApvlWlo6WVLcmQfx00ONDTd/GBqAVgsJhn/qT+spCl9g28v5zQrlFMli767JkV
	 3gw+lFffMelb++pArDV2HMrQ4wWB1msw/Butui9I18Km48GcX+9FVp37jXxHUBS8dpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kU9CFDSW;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D43606A31C;
	Thu, 26 Nov 2026 13:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kU9CFDSW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=TdL9/DLwEwmbIZFeG7DV1NSVGl4q1MyFCCEF8H1BFWw=;
	b=kU9CFDSWwmRRCCyBgPxI3fu4Z9Oa5ZIe5TZEU1V35oCWO6f7rOBnbXrt5IIet9
	aQPsKqiB6YHOGbeP2G+c+ZmG4AkWUAW0ZKnmYtEJB60uqHstqGERSUrT9DpxfOOc
	roe7MEQ0kRbe5qr92kUslEZE6XtkcpI2+sI6rvX09JP6U=
Received: from piano.lan (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCX5D+FMQhr7GOQIQ--.12015S2;
	Thu, 26 Nov 2026 21:18:02 +0800 (CST)
From: sakimidare <ssmzhn@163.com>
To: linux-media@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
Date: Thu, 26 Nov 2026 21:17:50 +0800
Message-ID: <179569907086.642669.17381830387392181040@163.com>
In-Reply-To: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:PigvCgCX5D+FMQhr7GOQIQ--.12015S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU775rDUUUU
X-CM-SenderInfo: hvvp6xrq6rljoofrz/xtbC9AtLeGsIMYt4KAAA3F

Tested-by: sakimidare <ssmzhn@163.com>

Same setup and test matrix as my reply to patch 1; no timestamp or
decode errors were observed in the H.264/HEVC/VP9/AV1 runs.

