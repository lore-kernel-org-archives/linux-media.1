Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793400500;
	b=2XUbC72e6PXi7vP3HzJJHJxg5RO7eI+8S4Bc7b0NwkKb+30IJiXZsMqzLbd7o/hw4Re9
	 h/SGC4MrsrN/DFd7RWdNd9h6b5DjJXePPCq0GzXGVpBjtNrBnWXCP2Y1Hs4B17pN6eHBK
	 UnymPPm9blBIOUXH7tzMMXqgvfaSgDHfWP07rcsWpJfT4xqbjJc83PDaf3fu4wbVv8D/R
	 h9tRRFtaQNmJpQezej2SxauXJO28QejDCxSQCmjMinT87U6Rcmd5KNux3MKS/TL/1BMd2
	 oinpoz9TlwHI5co68BDr0+2sZfzCOW7qiCR4pP4VX8rqYFXW3BPXKXXUGJKxHof1/ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hCY5gWyIoDxvKlbtrzG0Y1Wy+p+3RQddBiJlcOBca6E=;
	b=BeGfR+v5TmKcvQuUjtLRlNlIhOpLK9k6eYvcybyGJXVWsXD0YGmBoBuXzLem71+tlzs2
	 LktXBF2b51NqXTC4yoQmMk+fc0qyHBfALP7GNyqFPFdfSYnZrbVF2VqX5apaXTQqToPoc
	 PiERkEXhtrVJ0UuRPxRQQKFA1itKQKJzFmbMJedCm5bo8Qi89DLvOvCBarLc86BkULtxR
	 9j/Wiq62UdPtLxpOIFtab08f8Q/cUyZP+i3YqB5VAqhdfDRs4nI/3KLIqEKvMZh/tMZtb
	 BjTDakDC6W7VNOy1B5t5TYpoXcqd01GUp40kd2y2qPXztyewKbBKrAwpmDZ2sRuoknQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=vuVWLu9M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE12606A31A
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 22:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=vuVWLu9M
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4jGbpt42W1z49Q6b;
	Sat, 31 Oct 2026 00:48:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1793400486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hCY5gWyIoDxvKlbtrzG0Y1Wy+p+3RQddBiJlcOBca6E=;
	b=vuVWLu9M/4/Q6LntWMZAdDZJh3srbR2JkOySypRKJ791v5ouc2ysNOJCnade7AI0wm+hEE
	hqs74a3i3zgzNC/rhsob5QlSfnHtjwdtwLFQnJWL1zlToE8OclfGHMjEJLUzTj8s15bOCw
	aYIZ3aJ3kV2sHBMITPK5EHOj4fyRjOFQ0UIe4okx57tIcc4ZeU0OAJCp+P4xuP0IepCVvR
	J4k2y97dUF/ZFYL4jKxMs7vmKGqceeIZxdZHqpRmVtyoRIbbn5JUGow2Gmi2i0TSqPlCQ9
	ojeVyyhD/5aSDPz3ZQliMbP0U7Jo3vwKveh+CxXofFNEHw1nR87Lgl5Qp7QQcA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1793400486;
	b=Mj1J386f5hg1pGeSIRsH+/PbU4dTibMOHNHj3kEttsxfAPZdaTb3glE+LXOjnU/b2V1b2H
	teTbBfsU3K/NY9SrLKhC+EDvNQKULXBEzXnfP7EUgMnnQDhNx4UdHALvzdS+RKfkC4LoWu
	EliPDLxDJB4XJcZnv+9ppwi2WQCOSjI1EhPH6RTIOIc6eRS6wZUtFvDgdVJ1Ocs3nm0Xdv
	t38Tchp58VWn0+Hongv6g6mvF/8av1BCz5Bb6qiDM7IVb6JlqZWshTNidnEdc5+6/br0c4
	YDE9ZcMQNNHL86LXWoY1YkdlufVLvRPcIkxfnVFouzv81EnnIZIv5zHSjRKV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1793400486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hCY5gWyIoDxvKlbtrzG0Y1Wy+p+3RQddBiJlcOBca6E=;
	b=miW49LySdALTsL6y23Zonp8LzsLo5DnKathoTnDQSrbe8fKoZHoNYkRLSMKpSn2oj4BBPc
	2QiE/QA5MMjkQOv4W7CEOHjeOxCL0UKe4xrT2QWv4fmBoyadcRXUm8Yn/0miZoPAPw2kC9
	fbGfAT1oi7Bdy+E31HSPswxlZWQ7BmqbcarUMS60Onokt36WoAeZ0D4Hx4tEnnznjiJiHt
	8A2y6TN6GUWA317aemeuoddCYTDq1G8+oxCixbP4gfzQDiI1E335VNsuG7D7QSi30daAWA
	VdEgiHYafiqX2daYfPB8vH06OFdB8D3ciepCKu1P18DCIlsFApAF+Yhq0nO1Ug==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F0696634C50;
	Sat, 31 Oct 2026 00:48:05 +0200 (EET)
Date: Sat, 31 Oct 2026 00:48:05 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] Documentation: media: Document impact of errors on
 buffer fields
Message-ID: <auUepevHsfBZB2nV@valkosipuli.retiisi.eu>
References: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>
 <auR63iwOm_mih97K@valkosipuli.retiisi.eu>
 <20261030140958.GB3109745@killaraus.ideasonboard.com>
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
In-Reply-To: <20261030140958.GB3109745@killaraus.ideasonboard.com>

Hi Laurent,

On Fri, Oct 30, 2026 at 04:09:58PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Oct 30, 2026 at 01:09:18PM +0200, Sakari Ailus wrote:
> > On Fri, Oct 30, 2026 at 12:38:15PM +0200, Laurent Pinchart wrote:
> > > When an error occurs related to a captured buffer, hardware can produce
> > > less data than expected (or no data at all), and timestamps may be
> > > unreliable or unavailable if the device uses hardware timestamping.
> > > Document this in the description of the V4L2_BUF_FLAG_ERROR flag.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > I've posted a corresponding fix to v4l2-compliance in [1] to relax the
> > > bytesused and timestamp checks.
> > > 
> > > [1] https://lore.kernel.org/linux-media/20261030103717.3098080-1-laurent.pinchart@ideasonboard.com
> > > ---
> > >  Documentation/userspace-api/media/v4l/buffer.rst | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> > > index 94dc2719e907..5a7a1511cee7 100644
> > > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > > @@ -503,6 +503,11 @@ Buffer Flags
> > >  	streaming may continue as normal and the buffer may be reused
> > >  	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
> > >  	called.
> > > +
> > > +	Depending on the type of error, the buffer may contain less or no
> > > +	data. In such cases the ``bytesused`` field can be lower than expected,
> > > +	including being zero. The ``timestamp`` field may also be zero or be
> > > +	otherwise unreliable.
> > 
> > Could we say that if bytesused field is non-zero, then there is a
> > timestamp, but when bytesused is zero, there's no data and probably no
> > expectation of a valid timestamp either?
> 
> How about this?
> 
> 	Depending on the type of error, the buffer may contain less data than
> 	expected, or no data at all. The ``bytesused`` field reflects that
> 	situation. When ``bytesused`` is zero, the ``timestamp`` field may be
> 	unreliable and may be zero.

Looks good to me.

-- 
Regards,

Sakari Ailus
