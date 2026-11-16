Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858736;
	b=l8atPk1jBt0yU5o4PunOq6/APgeZRiVs2nYADOpZ+FbUv0fEB26QJO2TEjaP6mJJrbEN
	 SOtZ6DYhOLO6I8wgWbtep9E+GQ13WAjstmrEvE2gshpCr52NMqTmniR7raF81TJ7UjUF2
	 Jp34Q8w3u46qjRNic3jx2RcqBkdsFTElSxRUIgdMJD2Wq2a7vVYvtOEzwHWqDpBdFnWJQ
	 lRypVT8FKxAyLrQ6512KoS27U+RCW3qyyDJ4mwLt/bgi+hlWZ02zdpsGsuOicjruG9H6N
	 t7qO6b5GuVONu3dNRwtfQDVdku7LdYugl6/MIzESybnAyaBhwdCHwHbZt+TKrN00AEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
	b=ZCBXmbN4cnEdyzA8n8/qVNv7M13fB7dsxRY74tZz6pgirheJAfivPxiNTAnlRTxbQwrx
	 8YS+9+V7yU66qcAVohkcDZcrj35KOdTWGozUFHBDKqVr2mSQ15uJFz9GrZ5mO2krMMTmr
	 Tl4Bns6O2Y+/gh/2x4aU6yfXMqd7xx1+J2RNDQb2EpXWyf/3CNQERLUXM3Mv0bZ4cxcj0
	 /1+81PU2Sw4tDrZXFo6u61Dk/Hil53HspHN9bwUMdGxiYCmBX5mZXr9QEmTqQSsq+6n3Y
	 qXiPsn94czrrqUegsjYvYHDA/uWRBPr2lOZDeB5w5Y2tHNb4PJS2Ibde59eOVnO/K7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YcqWJI31;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BED606A332
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 19:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BED606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YcqWJI31
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55d3563e50eso21365871cf.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 11:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794858735; x=1795463535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
        b=YcqWJI31Q3We3zqNvL52aNkFr++cowdUSJ0aOSCLtCZgOyPTfxfZMV4aawKPfLKj7g
         4m2sGeUiA0CXGadMrFuMRIl89TE0lacup406nbrhvwqwPIX8FxoVlYidwE8/s7P7Wszm
         OrbfdLGk33YGmzpkBYmsq4F3Mxnt+4Lu+TymHPjdbgW2SfeAeQs52uRWqh/1XVhhLOxn
         GvpMlDfLIXvCkNJG/BKPMpLBeKmXfFzSUPrKKeUURMUv+fsornqCLKr9GiRTo2LK7Tab
         rlciZWXd7u0mEyCoyMVRbS74CtgQ2ZcTLr22IpH7H7u3DgVnSQkVWAwVkGPORAQHY8UQ
         R7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858735; x=1795463535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
        b=Lv1Fks0aeSqnzfNinQkztEKxUDqBmgS9Lb19xQOz8nd+cgq9pDfSWSh6JPo3Ct5+h+
         fzNeaYBdzGBKCQsMo237mmwYw/L2cp4QY0++wSVbOFwKTU6OYaXLJkcqy7r+km02p2xR
         ERieI+XALC61ugw2bTl1k5XSr5HnP5FMwf/CvXxAQ051IV/NJsSLJjSTamwuB3Gea7ER
         pEzDvYo6VGv5eknLgDPUmRG6UI9LNl3OdC2g0bXeV+1hH9OyRfz59543ru7oTd+tdqdc
         tSq7esT7QxtEDdSwSzPTwqlKAmRI+P0LFAE5T4aMZTPXy8rkcZ4W10U6FC6VCx9MmeMr
         CUGw==
X-Forwarded-Encrypted: i=1; AL+hErHhn/IH9zHwSmqb2Ni39HzZHNdjMtZb2ePrICp2JNiiHA+7FCTXEBQAHUMyr91oAR+UzGh1cSoGYK2QMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9aqPbHF+2YhzPw1qbkIHSL1jOOW6YjCZIs9Rg3XwC3I+Ze8ZBj
	VlkhN1nxCBtjWCAK2HOrQHdQkzDDZdR6XJrGdn3OiGMUi1XKojLLmX9oNjHWLutAxBg=
X-Gm-Gg: AYBFou37fvipNGSdLmU+IiQA/ZWcz9gJJixYkMzUIumQ6sEDJ/wxLjHMKTg38j0hYo4
	kMrcH5+bzEcnMstDVNqBX43yR9d8PuqLu7G0fY90tfM+fmws7XK6/XWYX8may+spB8H536j/Znt
	moaTAFygKwF3neNYlepIRDPT3xFvKk6dhKKNuUC6LChpAd0KtvzzxaGQIO+76DIm4pt1d4hb2dd
	U0CQ8sCoZbbNiYMp1p1TcX7lcdC+/2ZmM4XSH+nwNZszgYfKBg0d3rkD6Ac5L9VUS8XQMp/nqAp
	bx+8h/C5xFKI8KnojAm4MJrmY2PLLoMFhH1H2A/XS1qJ+3h/nU2LqLxAP6vWZJKP8qEsCvZxHaj
	2v7HeDI5k+27zZB2Xq+lg3CDx9xbejvP7VjPnQ7gEg6cRrguH6ygcSNg8ZuYRzDLHswu7ystFMp
	2ZmKxCzxScvbzgAuwgkNgPlq8nn7yJ1lulpnCL+YpF/gqjM50G3cmRBwwQIt3MjXIlIHbUXa2/Q
	jNRVpQx3B0ngf5VDYhfyJTwKPoK8ckdOpZqB4qAvpE1AXaZulfLpPE51qNx4lSIxg0Ar84kmCcD
	WBYK/w==
X-Received: by 2002:a05:622a:13c6:b0:55c:c7ab:4445 with SMTP id d75a77b69052e-55cc7ab469bmr121785021cf.29.1794858734926;
        Mon, 16 Nov 2026 11:52:14 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f8319d44bsm48973876d6.4.2026.11.16.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:52:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2kP-0000000ALbT-12cG;
	Mon, 16 Nov 2026 15:52:13 -0400
Date: Mon, 16 Nov 2026 15:52:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tao Cui <cui.tao@linux.dev>
Cc: akpm@linux-foundation.org, dgilbert@interlog.com, mkp@kernel.org,
	loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com,
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com,
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org,
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org,
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, phasta@kernel.org, joro@8bytes.org,
	will@kernel.org, linux-scsi@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	iommu@lists.linux.dev, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, bobbyeshleman@meta.com,
	mathieu.desnoyers@efficios.com, robin.murphy@arm.com,
	mason@kernel.org, aesteve@redhat.com, tjmercier@google.com,
	harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn
Subject: Re: [PATCH 5/7] iommufd: account the hw_queue page array to memcg
Message-ID: <20261116195213.GF2452510@ziepe.ca>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-6-cui.tao@linux.dev>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106131829.3228926-6-cui.tao@linux.dev>

On Fri, Nov 06, 2026 at 09:18:27PM +0800, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> IOMMUFD_CMD_HW_QUEUE_ALLOC pins up to max_npages pages just to check
> that a user supplied queue region is physically contiguous, and the
> page array for that check is plain GFP_KERNEL.  The size comes from
> cmd->length, a u64 that is only overflow checked, and the array is
> freed again as soon as the contiguity check fails, so the allocation
> can be repeated concurrently: a 1GB region costs about 2MB of
> uncharged memory per attempt.
> 
> Every other iommufd allocation that scales with user input is already
> charged, and the pinned pages charge the mapper at map time.  Charge
> this array like the rest.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>  drivers/iommu/iommufd/viommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
