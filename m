Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699138;
	b=Kbj0XrLsSAiLkYt6lPDGIxGBAtwoqWtwpLK5xj2OCtx0VN53gilMPFV43Hrasys1fDef
	 jGWFrmBUalMhcxl4UnMfI1KKpiz2e4WKgn/6TeU2T4iUnKClMBh2iHV7QSiGCAmJtwfEL
	 BJCOoQ7WiiFNI2dzSGT1f2d4MbE3x4V4q8+wRVVxejFPO4ZpnhgWgNgde0QbbLnPKOix6
	 M5AXO5a4l9kvZuL7FSMteDd/eKz8QRwRURfXJ77cnWWdUnWDNKZlg730SX3sLHtP9iMLw
	 bH1CL4567qXMv7Wl596jH14sSH6p6eeyEFf3k6MkHaA2wBikxtSUZRHlRLDUFon9o+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699138;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=7V2j127l1tqsyJfA8ah4NSG17bIfE42V2zmp/Lcc3GY=;
	b=PYkq7+yJZEOvMoB5SoOao74aDI8hn9AfElTlynKMRb8KQFEfh8qI38P7UxQ9IhXSMVxk
	 z629tIs+uo72opVjKb4zNZXf0K3cou1BZ9AC74O/1dJgcD5kPgFVjNAXPu6rX3rLflSZ2
	 mwH9sJREQ0+0MaX62Xpfrbw518Ep0Ol+zi33u4yXw/bMciqZvUNaYbLYokTiBGUsBcCMO
	 S9vh86fER3SOP1EqFkaXDB37805hb81RB3vb2WnW8E6Nhpx/GBbR39LRqOICWeLWN28vT
	 EAgJXlsi5jkbMWhmGbvUd+xrVSuJ7M7s25I9MHXMy8PdLWQNTF+Ww/9ARGHvRcvdxOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=i7A9h7CM;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D05606A323;
	Thu, 26 Nov 2026 13:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D05606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=i7A9h7CM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=7V2j127l1tqsyJfA8ah4NSG17bIfE42V2zmp/Lcc3GY=;
	b=i7A9h7CMqc+4jYGnGyBjBIT0FqmC0ZmpQI921ahn8RNT2yNifBF8SqMRlzTC6e
	xWmmO4jvdO3XseK19fT7HWsxTaBVn0MEGYhWmjZKNqS5gBLVCNrRMkqYcU0UKOKF
	xDCp5jlt5CSbBhwNItJVV2MU5RLmwY3G1M/FPGjA4q+A8=
Received: from piano.lan (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAXBzKNMQhrcmiQIQ--.9590S2;
	Thu, 26 Nov 2026 21:18:10 +0800 (CST)
From: sakimidare <ssmzhn@163.com>
To: linux-media@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org
Subject:
 Re: [PATCH 5/5] media: iris: Recycle decoder buffers for non-display pictures
Date: Thu, 26 Nov 2026 21:17:58 +0800
Message-ID: <179569907857.642669.1595768910457906202@163.com>
In-Reply-To: <20261029-iris-va-fixes-v1-5-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-5-44a2783f782b@radxa.com>
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
X-CM-TRANSID:PigvCgAXBzKNMQhrcmiQIQ--.9590S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7rgAUUUUU
X-CM-SenderInfo: hvvp6xrq6rljoofrz/xtbC9BJNemsIMZJ4qQAA3A

Tested-by: sakimidare <ssmzhn@163.com>

Same setup and test matrix as my reply to patch 1. The AV1 lookahead
and 4K cases decoded all expected frames without stalls; as noted
there, my tree needed the one-line PSC_LAST adaptation for this
patch.

