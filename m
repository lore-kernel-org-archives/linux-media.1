Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27625523785
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711645; cv=none; b=P5U/b9Xjf1Swyh0IJo3RRAlB5wMC951/AbAjZJ4TUFUQpuL3gMsT06eRH42Te80PQDUJLYdtajH84zdWtsS//4Hootzvhaogs3f/Nv3MzXlzCmytg6D5V/n7X48Sqp6D64UD9G4dUL0w+DaM3hNTZfIYs6K9e3Tmd3nHochntus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711645; c=relaxed/simple;
	bh=d2Pdheq5TEoj0kP/4JTqWlNZuyyufLJOnBh2gR/G9ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InD/K8hPck1xFyAILnUnStIPxIeauXQymTZeHyzs3G0MKXCCaDWm0vAqh7u5tr4c1FGSovztwwzZP3QzJ5XMk4WdrXJLbD3xYRzO59wC7NrqMdvk9IkOTH0L//zcOY3ji393LgEzFeWu/3WwrqMqjBG5nB9kT+1xIusohLmyndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suUkfmVE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suUkfmVE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so21881455e9.1
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 12:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790711641; x=1791316441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u27k5NmvBzDFGlc9tKb68XrZeYB1FzHqqK5+lL8nqVA=;
        b=suUkfmVEjhSeDCtnPBwdPfraeh0BaU67xIhsFJKW8Zb8u3GqqldoIq7ZJDI2TWqcqO
         ICwO2Rt0FM+N8Ji39M+kNqvHmxSBvQ6t3LK3HosYr68JSc1CrHFJfyLGstp1FA3NaTkN
         PE+OD7gqI1ShkuDswSPjqteL38R23+wLTXfln5xjlc/4nr9CssJfQvvAXJZairavXRWL
         gekMEuMDdfFdUEctwETR4XKqfMInSoqMsm5MYTlE1oLDYKajK51fyAcpjQuIjWPrgw5l
         ywIRPa58TClW66Jee4M3/hihCZ7ysBYMC0UxnIX2S7CmcAY0skXaLJlaZUxuv2XvxKEI
         KjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790711641; x=1791316441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u27k5NmvBzDFGlc9tKb68XrZeYB1FzHqqK5+lL8nqVA=;
        b=Cpoq/Xaa4Ja0snmszkYS1YLzQ5gGegJS3D8Ha2/tSbBRXegEnFNlx9eUXJxKqP9Alv
         rLvrG6Pi4VvbDa0JYzvOnMhuZDu7Ro3s2pavzyKgjpoqaLGLh8lHqdjaBNl4wgp8vzI0
         Ln9xuECepv4DkTt/9PtM2RAQb3Oec5k9RwdOTfzxNW0JM2pIaFlM0kAHqrY25+GSjgb1
         RAgelmJ5rCOovOw9pCBb18w3rpFtpUC/HBT1uqaV3rOfFZCSGtyDYvdmKssD/gQB6B+Q
         LZFTF12XY9ieLdvXunxzbrnE9tbC+Pf38vr53FoRDLLEGJoUxsKwO05BCqgs/qe2amKS
         2ccw==
X-Forwarded-Encrypted: i=1; AKwUvBzO5QU3In99kKrnAWy9IHwiAkhTMlhHgoFCiAtjop+sRvw4rmnBkQLmEXinszGi4ipNZmF8F4b6SPHQMQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nJVHGsHICcEAjvTpFFUd2Bw1CbV7tcUQjT2xmIktkq7Vh3FRW+
	28lStDGgGfAE2wWxc659za1OIu7LN3bd8m+mu1GQFCH+3QmEOqHoN78H
X-Gm-Gg: AYBFou1qAknb/BdDCvr7AoFiaL3Zc4LhGBqNRa9wJmz3cEgkwbZfeVFpxNEsiQ4zlwb
	ySGPOTaDPh8wELQpqZLbACri70ZtTbcfvIrQu4KLwDBCCYsP+a2QKfGEEj7mV+LDXJ0+sDpNfTq
	5GQeCu1aE7UuhbXG87myPBbwPpTRGCwVNs1P2pjhPW9cxuo7qDkPnOkgB+43zkIRFJ3Gah5TBhs
	pSeCIFE+WDllueY6ruNKyBzycRogM30IX/65JZhXcdu4T9ey5oQLuZH7nhWlDdzllYK2L/R7T0z
	H0w+FNt1RisUN/82VbQp7FtmJvCRdzQAEm1eXNZ6kQjLVmoCDcV/IjGuBQjrdfL2iH98Phb3HmQ
	OmzphepQjRguJKXYi1Omvyt+pcAuZkPNTv1bpu5qCbXjjAl0viFWUdwwrIENq0xTzY8HcQVDb2u
	11O4hsk2QnzjWJ0V+oWmcsNmLA8R+tl2EoUTwM8SK4uFEH3dUSkx9IXSSRph1w5ICuhnsMCpnyc
	a9N6/jxNggu60keFlfz6K6M/U/eSWMoAnmCTaDCUoa8eLssWV01etdXmus8QIqf0ikAwUeHASsW
	1dvWtVzssvR4HoJ6/yIfUlM2KnRRJJfuZUUFCSITPu4umC7ilNtO3XQnuhssz4iInmEmEu537LK
	V924JWg==
X-Received: by 2002:a05:600c:3ba3:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-4a015155f74mr2815545e9.26.1790711641143;
        Tue, 29 Sep 2026 12:54:01 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-9c32-f801-9d9d-c89f-9fb1-4ec2.310.pool.telefonica.de. [2a02:3100:9c32:f801:9d9d:c89f:9fb1:4ec2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015019e5asm8566915e9.2.2026.09.29.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:54:00 -0700 (PDT)
Date: Tue, 29 Sep 2026 21:53:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>, g@mbp-von-karl
Cc: sashiko-bot@kernel.org, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] udmabuf: respect the device's maximum segment sizeg
Message-ID: <arwW9XNaoppy5o4k@gmail.com>
References: <20260929054835.94118-1-kmehltretter@gmail.com>
 <20260929060028.371041F00893@smtp.kernel.org>
 <20260929065601.99518-1-kmehltretter@gmail.com>
 <20260929120317.GH1616761@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929120317.GH1616761@nvidia.com>

On Tue, Sep 29, 2026 at 09:03:17AM +0100, Jason Gunthorpe wrote:
> On Tue, Sep 29, 2026 at 08:56:01AM +0200, Karl Mehltretter wrote:
> > Right, the misc device has no dma_parms, so it gets the 64K default and
> > sync fails with 256K pages
> 
> I would ignore this, it seems fictional to me, and if someone really
> needs to support this rediculous combination it should be done inside
> sg_alloc_table_from_pages_segment(:)
>  

Fair enough, Sashiko got me there. Looking around, 256K pages seem
to be barely supported today: they were already disabled for 47x, and
I couldn't get userspace running on a 256K-page 44x kernel in QEMU.

I'll leave v2 as is. Thanks for the review.

Karl
