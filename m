Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.209.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199575;
	b=Aw3keIbwWSAvpUAXb9HAWX734ml/BUPhudHo/XnwICSqAMpbAeMDKH0foUsn/27Uxy9e
	 BhYhi9Vfpk2yWH1olK/1xkeeqzbsanjRTBPNOwLITZd+8o/b/u7G2fQEr4m+1vs7hA5+U
	 LcIwfctcNPGrdQm+dViGif6dRl5ZjCLoe3NdK1S8p+r7P/Y2LUlrIXlFhN5db6IoL7dZM
	 f4+YVN62RJtlYG3BFLs5FKWHj1RJKFZmU++y005owE5lg7BATIKlX6X5CeAhPCkMLnlNF
	 LsjDzDorrYNsmwC27xJzy2zkeVb0Wet1lUU5EBjIslmhDd6c/BAsfX1msSehbwrLMkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199575;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Tank-Harmony:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=XE3Je+ocroISKFHAV5JHSwDyP53+LTrgvXdNFl0b/Vo=;
	b=iKBWGhr3h446ontAcsDi3HE8+YNTJM893v1P/o0S5Fgfj9syMq/KqwEIN90i7fx36ADk
	 bhmi+u8d2KZWTJjJA9RU63vV2/p1bLdJ0cqzbepMI0Djlq4gu+L/vRloh96/h4UTQWHXg
	 YJJg+eSAXyQK7Z6T4sjUIrgDv/MnFZrn9pGQkR1cpP9BLyioR7ziCbOUvkZCwKLO06zrL
	 Xa3acTfwLBPkqHMAq63XDhOPiFlKFvDvAjkeJLZ6NN2fAMfEUGstTv7k+3/gURK9sNt8k
	 GNLaIPIkmE4ZLDyhwdH50wVD4lV4sh9pfS4G8jdMC1GTvc4iUOBa2Pd5KPEBIihIVjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stgolabs.net;
	spf=fail smtp.mailfrom=stgolabs.net;
	dkim=pass header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=GGaWa+Mw;
	arc=none smtp.remote-ip=23.83.209.135
Received: from olivedrab.birch.relay.mailchannels.net (olivedrab.birch.relay.mailchannels.net [23.83.209.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF479606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF479606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=GGaWa+Mw
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B933742AA0;
	Wed, 28 Oct 2026 14:59:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a220.dreamhost.com (trex-green-7.trex.outbound.svc.cluster.local [100.96.16.126])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4EEF042727;
	Wed, 28 Oct 2026 14:59:28 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Tank-Harmony: 78d2f747042e4d5d_1793199568528_2959092911
X-MC-Loop-Signature: 1793199568528:3909109401
X-MC-Ingress-Time: 1793199568528
Received: from pdx1-sub0-mail-a220.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.16.126 (trex/8.0.2);
	Wed, 28 Oct 2026 14:59:28 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a220.dreamhost.com (Postfix) with ESMTPSA id 4jF9W359VYzYD;
	Wed, 28 Oct 2026 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1793199568;
	bh=XE3Je+ocroISKFHAV5JHSwDyP53+LTrgvXdNFl0b/Vo=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=GGaWa+MwRpGj+V0CBz4xbroyakBCHQenmvHnq/o7cQqoJrgM1qLdgSG9hhmj31gQb
	 VG2lJrz6tgCacbSb49HP9NlBVrDdKfbK/yNf+qiog+J9XS2GDK3G3EwtMKV/Vna+fP
	 67BgL4Rcd5b8XWWgG8fkEz2R8s/+zhyX//YLt/840k6U+4rXBhMPSLxVEg/RMocTYu
	 ApIo5WpF5WO81u+Kz1OHrVlTdM92edipvDrBC9Rwuqp74L6ROIwDjUhdCC+OnyXCPI
	 p5k5HrNcPS0Vl1IxgVp5iLANMmcsDtu2CX5R56JsnULeMwkYNVtFEbmIHANr2XkODq
	 ZjxpCnl4cXSoA==
Date: Wed, 28 Oct 2026 07:59:24 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Christian =?utf-8?B?S8Ovwr/CvW5pZw==?= <christian.koenig@amd.com>
Cc: sumit.semwal@linaro.org, phasta@kernel.org,
	benjamin.gaignard@collabora.com, jstultz@google.com,
	tjmercier@google.com, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] dma-buf: system_heap: 2MB chunks on x86
Message-ID: <20261028145924.5gcjfjbjd2ejgozt@offworld>
References: <20260928195850.1982569-1-dave@stgolabs.net>
 <20261007120745.bvhqqa6cowqnt3jc@offworld>
 <52a82bea-3105-4bb5-a6e0-b1a0e3b808b3@amd.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <52a82bea-3105-4bb5-a6e0-b1a0e3b808b3@amd.com>
User-Agent: NeoMutt/20220429

On Wed, 28 Oct 2026, Christian K=EF=BF=BDnig wrote:

>I've just pushed patch #1 to drm-misc-fixes.

Thanks.

>
>I'm still wondering if #2 is actually optimal. From what I've heard only 2=
MiB should be used and especially 64k doesn't make sense any more on modern=
 HW.

I have no problem removing the 64k for x86 in v3.
