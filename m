Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278278;
	b=QsbvK7bAxtTkbqkdgQ79T95ec74HcE+ofzh1WVShRTRwKcA0x4OKiCN5HvSBa9clWiFh
	 fENv5PwDSs7j0QxEbdLc8aTVH8fZAiHEZWh0DxXJ2sjgdSLXqv2xXdPcbo9sO7JBSSFLm
	 /pQs9egon5/euqGaI37MUtk4UsUTp+PTtTi7wpNdL9qpmhpHXkpnxmdsdD9rKxiaECVqA
	 xVES1gYqXZ+HkvNIQqu3zbUfzI7urB5b+/Iv4+U4QvrtRrp7vJ5KCsUjlZSYnKTW9sLys
	 pyrZzoBdCZl4rqIvaWb3TZO0wa+WRtNotQrtXq9+V2h0m5Isvf+NYRQf8/4lg7/l/Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278278;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=tj1jm9NB8xU3shUHR3HIvBY7qaazXuun/Q0CFLdMAYo=;
	b=FQbx1YiEE/ZIvHRVwkSAB3bz71zNp7xvk1TjVqWrEo/VPYhIe6aH7u09qV75DrdBOBK4
	 nCkVXQuCjO6Ltear4myfZb25wMl1l7EfV4RC48Av3eMU90djjbHaBWYydIsotQd7b1BhI
	 JVwbRtWxq/NejK/ZPGcNNAGwoWSowNsmrZrlZ3yGEvFgxj15GHBxDrXD1M8Vu5JSc+O/J
	 86szePUKqSiWPod2QW6u/vTkOW/jSrjmIifxjK/p01Rth5KmScSwwK2uBj3K+LQ/g94OE
	 b1Ur+DhCoVwFfoz8vpbvvbqBggS4JLUcd7vR8182sj63InCsLCRsX8oeejdN/Q8MaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=I6Eq59vl;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=fUnY8SUQ;
	arc=none smtp.remote-ip=23.251.234.59
Received: from e234-59.smtp-out.ap-northeast-1.amazonses.com (e234-59.smtp-out.ap-northeast-1.amazonses.com [23.251.234.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC31606A330;
	Sat, 21 Nov 2026 16:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC31606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=I6Eq59vl;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=fUnY8SUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1795278276;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=tj1jm9NB8xU3shUHR3HIvBY7qaazXuun/Q0CFLdMAYo=;
	b=I6Eq59vl3CR+FBxC9URHML5wOb2y6taw/fwNZ0ZoB1JdtXXKJouDYvqmZvBz6/Pa
	Tg/TV4NMJxoKkoPz4lMgI4ekBF/E0BT8hNeIuXcp4osHIzvom0Uy+W++RXPZSs/nvSk
	rH0uIj2T4I6/64uGOdrgc+TpfmkLL1zPSMPyAvLE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1795278276;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=tj1jm9NB8xU3shUHR3HIvBY7qaazXuun/Q0CFLdMAYo=;
	b=fUnY8SUQjNWPceD5fWQwjvqdoZvLnKjdMPUgDQ85nDbdxLm85OgoDdBuQpNgnVor
	unJOfrg85jtyoPGVN38pOHv24UygQm/cMteXwQh4ntK7fo0klYNuhviXHEEKJz9ATKf
	NGt1g6EKb079KOKUmEBP/V6RmldmQBjqxShlXBic=
In-Reply-To:
 <010601a1333dc2ae-f24ce995-a0a2-4d38-80a6-43a3696713ef-000000@ap-northeast-1.amazonses.com>
References:
 <010601a1333dc2ae-f24ce995-a0a2-4d38-80a6-43a3696713ef-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: i2c: vd55g1: preserve the stream-start
 error
Message-ID: <010601a1feec84f8-7303cfa0-9435-47b7-858e-c32666f7d9bb-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Sat, 21 Nov 2026 16:24:35 +0000
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
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.21-23.251.234.59

Hi Sakari, Benjamin,

A gentle follow-up on these two reviewed fixes. Both are still needed
in media-committers next at ccf78740d638: stream-start returns -EINVAL,
and an exposure-read error still suppresses the stop sequence.

Could you pick up v3, or would a rebase help?

Thanks,
Jizhou
