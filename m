Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699101;
	b=PBU+8XkM59L0drQ1ZdGlfDtELxwOiZ8q6HEfZsp2kzohXLCIS28/uo8CCCJGGB1Rq909
	 YTuOfaVQUWBmDfKSnUe0wCmAYhhkfODpLym+2woEiLCS/SXqATUVIw5X3JnENBEHTsShQ
	 bXbIB2mVEwQuFIC9tHQlWYUVWj10Qt+XyTCkZN0rQUryydwosB4qlCMSfMFsc3/wbFkP1
	 WMPM3hJEiSHDmEcX7yElxm+L3rBYtqhKBwbX782Cl3KmWux5LOAr/77HfTxnR5euVnbID
	 KOeJRbSEoS05zWSQ4kwHvIVUyHJztrRRAQEB9nuxlZi97vm55OL2rACRu3Scui8hRbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699101;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=AjUdkJZhXrJ54YfHvBqgLKNLh4V//1m9hfbnXd6pg40=;
	b=ChR2x1ulbILq+X/fM/6hqof9aoCdMCsD0dOH4kMlwX0vgWWzgBmFn9VIqp6gxGkkPKbU
	 DPcAoXdpEmNPvYtPENx3enL6YULAf85blYX3P3ruGdjYw/crw6vmvkpDynp9FfZVBsjBw
	 HotVsFhF55MbqHnbtB3d8q8CPyPqkUSoBptRRq32FLlBuz7CFkTKwzbxIOnIWhQpqajEf
	 WsXEdM9l+uxCYVx8kD2FfGWhezaOCAX8YeKGIwYc287Ox2EwNuJPzz9uxsgXp6EjITEMX
	 NfVVZVoI6g235xL5zUysnB7YtsN+KaPX1VTB60d3icYoWOyn7aAADhmbW4MPEMlsHxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gziX4o8y;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED1606A331;
	Thu, 26 Nov 2026 13:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70ED1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gziX4o8y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=AjUdkJZhXrJ54YfHvBqgLKNLh4V//1m9hfbnXd6pg40=;
	b=gziX4o8yXAvnVZc2gE8DZSHWX4UAP/SO1pJPnCKDUDobQM6ScVfrFzVZAhw1YR
	j1ajji/rLOYRk16pwqWVKyTVLYiHx8nsEaRiAYAn0vWqlFuTvHKQDaKqzsDrZIu9
	kxe25Mzjh7RQ0eUrzAONK2s0Czj+mZJ8Kj5awOaz6UgS0=
Received: from piano.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCHZSJ9MQhr2GvHKQ--.39847S2;
	Thu, 26 Nov 2026 21:17:55 +0800 (CST)
From: sakimidare <ssmzhn@163.com>
To: linux-media@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org
Subject:
 Re: [PATCH 3/5] media: iris: Add deblocking filter controls for HFI gen2
Date: Thu, 26 Nov 2026 21:17:43 +0800
Message-ID: <179569906318.642669.7346719945750707126@163.com>
In-Reply-To: <20261029-iris-va-fixes-v1-3-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-3-44a2783f782b@radxa.com>
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
X-CM-TRANSID:_____wCHZSJ9MQhr2GvHKQ--.39847S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU775rDUUUU
X-CM-SenderInfo: hvvp6xrq6rljoofrz/xtbC9ANJdmsIMYN3swAA3d

Tested-by: sakimidare <ssmzhn@163.com>

Same setup as my reply to patch 1. The deblocking controls are
visible as h264_loop_filter_mode, h264_loop_filter_alpha_offset and
h264_loop_filter_beta_offset on /dev/video16, and a 1080p H.264
encode with the new defaults produced 60 frames that decoded
correctly through VA-API.

