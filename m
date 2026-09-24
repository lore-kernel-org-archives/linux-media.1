Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D33B5F63
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.218.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260817; cv=none; b=flhIfqFyifG2dk87CEegNufo7170Agrp0c0wqInUpwWH7GA47wUmBbSNiL59cm/lGC5ZpaxXOS10iON5rvdEUSvrXA46nF7XKbZezcnDHUpnJxQLMpZ337t7tBIxBZOAycpVjtc59IY3D2y37tMu/Oyp0DrXdl95yhWh+K3XgbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260817; c=relaxed/simple;
	bh=fFTgQxpLRMyIDkGRkEct8M3mBmUVlPAFnBwTTUnIXGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhobDxnN0Cxf1x64xXlygnCjxHWf9Hx7z4eNdHF+LTulZc17DTQ595VzSNk47wIjP14AF79X9udbzDAT1ZqXTZtzO75eOcO7tn0Qt1rbYNKPrfCloTKFRPQG39687j3Np3BMAxXhLm2hQv2NDdf23AZY594eItkzh0e4ZMuOOj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=m6YuM63d; arc=none smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="m6YuM63d"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E8CFB7A2A19;
	Thu, 24 Sep 2026 14:02:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a243.dreamhost.com (trex-green-6.trex.outbound.svc.cluster.local [100.100.66.64])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6E5847A16F2;
	Thu, 24 Sep 2026 14:01:59 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Hysterical-Glossy: 29b8471a5dd85187_1790258523717_3377842951
X-MC-Loop-Signature: 1790258523717:1375064299
X-MC-Ingress-Time: 1790258523716
Received: from pdx1-sub0-mail-a243.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.66.64 (trex/8.0.2);
	Thu, 24 Sep 2026 14:02:03 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a243.dreamhost.com (Postfix) with ESMTPSA id 4hrFrQ5jghzymg;
	Thu, 24 Sep 2026 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790258519;
	bh=fFTgQxpLRMyIDkGRkEct8M3mBmUVlPAFnBwTTUnIXGs=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=m6YuM63d9hvA/ou0smxfrqjU4Ap8q2U+SErlE9SmUt9iP0IoPTmJMyhVUGB7PgVTU
	 abYoc4Uea1pZ3CymH3YrwgagHABHpj95OrheemWbnqFy/ULEMzzbpjB94RO/XU6jDY
	 nJHyEMCi7oSRxEODHjlDDrI7gLVg1kCBhSePEijnCZ7LJ5UIlxAjqUaz3yfrdNtc3I
	 1igs/MuchL3sRntmvMSUym0uQNREqJghoUlxZqHeAMy0gkK7vI14vjR2KTNuzyqCTn
	 g8E3RHrIK86S0aHF3KRUPEvDmSlYdwQm0JWVMPZNEl6XbYjV2ghtHbuetswpLFV8uz
	 p4W2yeRJPfnCA==
Date: Thu, 24 Sep 2026 07:01:56 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Christian =?utf-8?B?S8Ovwr/CvW5pZw==?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, sumit.semwal@linaro.org,
	phasta@kernel.org, benjamin.gaignard@collabora.com,
	jstultz@google.com, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dma-buf: system_heap: add a 2MB allocation order for
 IOMMU superpages
Message-ID: <20260924140156.howlrcf4gaab6kdx@offworld>
References: <20260914212258.2657788-2-dave@stgolabs.net>
 <54ae0d83-d777-4357-8e87-dfc3a5c7b835@amd.com>
 <CABdmKX1ky3Jfr7B-Oqaz17aLJwo1SSh1huZ05NG7D44SMF=9fw@mail.gmail.com>
 <871b6fc6-e126-429f-881c-9cc517ee8dcc@amd.com>
 <CABdmKX1g=wcLHOFkRN6DLPTABrnn2uWmgCKpCtixhiV_b+9J1g@mail.gmail.com>
 <CABdmKX2GU0Eby=SEeALzeEp5ragEjU3Fw468Jv1yykD1Zdrgag@mail.gmail.com>
 <d8d3af91-4f21-44ea-bc90-339fa1adacf9@amd.com>
 <CABdmKX1YtyFM_MoMbPr4JUCXCr8TGPVbXUrAoQRELpp54cK-0w@mail.gmail.com>
 <20260916162255.jv3dqacwtgfiv5kd@offworld>
 <6f31d927-c598-4033-aff9-0f8b2c5590e1@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6f31d927-c598-4033-aff9-0f8b2c5590e1@amd.com>
User-Agent: NeoMutt/20220429

On Thu, 17 Sep 2026, Christian K=EF=BF=BDnig wrote:

>On 9/16/26 18:22, Davidlohr Bueso wrote:
>> On Wed, 16 Sep 2026, T.J. Mercier wrote:
>>
>>> I'm not sure these patches were motivated by Android (based on x86
>>> focus in the commit message), but Davidlohr would have to comment on
>>> that. That's just where most of my experience comes from and what I
>>> can share details about.
>>
>> This series was motivated by exploring new use cases for dma-buf (such
>> as kvcache), not really for Android specifically. I was counting on
>> the cheap/one-time 2Mb attempt (current high order semantics) to not be
>> a problem for potential performance gains. As for the x86 I tested here,
>> basically because it's what I have on hand, I had no idea ROCm was a no-=
no
>> for system heaps.
>
>Well the problem is that it does work, but gives you unstable performance =
and people see that as a bug while it is an intentional design decision mad=
e to keep the system heap driver independent.
>
>So yeah it's a trade off, it should just be properly documented.
>> I am fine dropping this effort.
>
>It's clearly good that we talked about this.
>
>When something is changed here I would rather say that we have some #ifdef=
 CONFIG_ARM around the existing code and use the PMD_SIZE for all other pla=
tforms.

Just able to circle back to this, sorry for the delay.

I will go ahead then and add the ifdefiry for arm to leave it alone, and ad=
d the PMD size otherwise.

>
>If functionality isn't changed I think adding at least some notes that thi=
s only works optimal on 4k ARM platforms is clearly a good idea.

(will also comment the situation).

Thanks,
Davidlohr
