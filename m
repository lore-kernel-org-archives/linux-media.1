Received: from silver.cherry.relay.mailchannels.net (silver.cherry.relay.mailchannels.net [23.83.223.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2083387364
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374889; cv=none; b=QhkUdpuVbB0nKFgqEWhQK4Hd4dLARFKoamHVBoJuBzPWwBNZosXAIQuwPEF+tOXkOy1oW3j0wUoBdHAK1FzBm/u+DxbJl45G4RJAyr6sVdhyehpFd26v+quw4dXXqLBHum2Ioae5yyKHIEJPXrNucRjDDyU/ddMhNt6ovM650Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374889; c=relaxed/simple;
	bh=8oEwRjDhp/g5O5IJgNu3AVCApS2iO6eYS0+Ga3uVsYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzzyYg0xBgThFai3sZmuOkjZ5x7ilrbz8ORQVMBhbD/TCW3CZ2C5EP2csbsSTy3ZSQurSvj7Ugu7tyQ6D7ILX26aDDcLspeVWY3PvsQSrgBAA49hf63Wpm5czvWpInReySA+6bqBzb2k1mARDgkOH+Ie1nRfVeZQeAMKszseF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=medp0nLK; arc=none smtp.client-ip=23.83.223.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="medp0nLK"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 44F7E62A40;
	Wed, 07 Oct 2026 12:07:52 +0000 (UTC)
Received: from pdx1-sub0-mail-a210.dreamhost.com (trex-green-8.trex.outbound.svc.cluster.local [100.96.22.25])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0AA2C62A30;
	Wed, 07 Oct 2026 12:07:52 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Wiry-Attack: 3f935f035fb35f93_1791374872123_1820721641
X-MC-Loop-Signature: 1791374872123:2778721703
X-MC-Ingress-Time: 1791374872123
Received: from pdx1-sub0-mail-a210.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.22.25 (trex/8.0.2);
	Wed, 07 Oct 2026 12:07:52 +0000
Received: from offworld (90-182-211-1.rcp.o2.cz [90.182.211.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a210.dreamhost.com (Postfix) with ESMTPSA id 4j0Bhk1jC5z2Q;
	Wed,  7 Oct 2026 05:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1791374871;
	bh=ZDxz2d9KR/r1DvvGUR/3d7d34BgV8xYPWHjrmAVWSBI=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=medp0nLKQ8GaAcrCj2DY6DQeIHb36/EGpbFWXtLdoLBJhDGeTjk/N6sUJnJ5RMml7
	 X5cwzPgOPZXRAPGdlIAA8H3JtytaPDeRJA4HwDpEAPybRfvJ0xDdMdBt3RHsNwD+Kv
	 2xrPS3fiAdDt+iBHKSN4prB5cGkd4YCrAS6Sub5Y8FKRev1FYzSNIOtAOy4Xh5ZtGw
	 GIoREUbqjOigu40CYCSWAsGp+UZM44DWS2vj8NX84drolknccSVQ2aXk6Io/1QmYmM
	 fI6zL7ApernjyAcIP5xy4+ukxGfPstbY4m297Mj3hovP/GCvuqESGMqcVcIoxTUBnJ
	 pqVysgb3CYPCA==
Date: Wed, 7 Oct 2026 05:07:45 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org
Cc: benjamin.gaignard@collabora.com, jstultz@google.com,
	tjmercier@google.com, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] dma-buf: system_heap: 2MB chunks on x86
Message-ID: <20261007120745.bvhqqa6cowqnt3jc@offworld>
References: <20260928195850.1982569-1-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260928195850.1982569-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429

ping? if nothing else patch 1 should be picked up.

Thanks,
Davidlohr

On Mon, 28 Sep 2026, Davidlohr Bueso wrote:

>Hello,
>
>Changes from v1 (https://lore.kernel.org/all/20260914212258.2657788-1-dave@stgolabs.net/)
>
>- The bug fix is now patch 1, unchanged from v1, picked up tags.
>- Removed patch that adjusts per base page size (arm).
>- The 2MB order is x86 only, so Arm keeps what it has. Left other platforms
>  as is as well to reduce the change impact. (Christian)
>- The orders and the fragmentation trade-off are documented, both in the
>  code and in the userspace heap documentation. (Christian)
>
>Thanks!
>
>Davidlohr Bueso (2):
>  dma-buf: validate the attachment before asserting its reservation lock
>  dma-buf: system_heap: allocate 2MB chunks on x86
>
> Documentation/userspace-api/dma-buf-heaps.rst |  4 ++++
> drivers/dma-buf/dma-buf-mapping.c             |  4 ++--
> drivers/dma-buf/heaps/system_heap.c           | 24 ++++++++++++++-----
> 3 files changed, 24 insertions(+), 8 deletions(-)
>
>-- 
>2.39.5
>
