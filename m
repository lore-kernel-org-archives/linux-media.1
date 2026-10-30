Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358572;
	b=notnfAUnKUiXHEAfNNZeFtNjy9alnwddUN9/KBuqQ013/XrgGYATj+QECKDL6cOXZ/d+
	 kOCvt5nNVkSOO8HI/yGsXodTWLysBNfYwodJVHpKy8WzQCJlfQnKKrIu9Q4MVwlXosNt2
	 GM2tkMfqWgVQRorVFrTbjbptv+mioy0LNvUe/nm6Mf99TAUfBKOZzvzQx0t1BfRRamqEB
	 EluMb6H9DWMqNfddItQy+Q0ciMRIR3NrvBgzL80q2bm1gQ/xhK9VIOlkKxkYLPmn+ee7Z
	 Y3YW6BiQJuu8VLZyer5Jl8oTO08m7BB1vzlm7VOy9yeD04+jA9BDYNl2JJidvsN9VgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jLK+qaQYscaZrYd4//xxgAYfZj+tRZQQLm3D1hPHCHA=;
	b=Vzhe+bPRx60+JIGv0cTcnJYiCzDvq/M+EL/OdJm2BRJnUKQ0yyDZOCdCw0TmoI2UxPrt
	 iPGwO0lcEHpuo3jFG6+Z7e/yRvDMBmu3uk6VUrb+vIBJl21Oj2pHq7gLPf+67+kcwk3BF
	 +iLhXpPxBK/h53DjZZ6ToT3+MlyoBUsBTBBPiYjemEIdHft/7D3byh18z+Irk3p0Cqe6V
	 2bjlwOuXwdB3pS1085Gq04DaKJtG6daj8E65knsaNKwE3rgGKbF8aqAKM2deHN2PdkoHz
	 dGSd1Lo7Pt4WrBa/c7dRlvw0NWjinTsAam0dlX6pUAHSaTq0l5qd7JPyM4L0iHTLEUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=tKB3a2D7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA6E606A31A
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 11:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=tKB3a2D7
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4jGJJb2Ly1zyQC;
	Fri, 30 Oct 2026 13:09:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1793358559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jLK+qaQYscaZrYd4//xxgAYfZj+tRZQQLm3D1hPHCHA=;
	b=tKB3a2D7rNZftHPHUv/mrhqXdXTnCalXob6gqxUUlPBuMZL7ko11gIq/CgUiTani5SMXSg
	RChaRrRQ5OyCglYL0Hym+ezKEibToCnbZnzsIZThsBT9eNkI2eDEcpHYPkjW8p2sP0lXor
	ti4uKE5T23fw4Jbd3DKxZnDI5CTnozM=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1793358559;
	b=TITKHlYipbLyQIFgwrI6AUq+UDHROzkevlugC2BWzmQ+SNMl2HTPt/4GNEBxPagfE57waR
	2q/uKn0B7+MjN2tws0T3tKtdONOB32R5y8vps5UVLwlp5XEUtIFYmPMSEVf4PGjqwaG3xz
	iQabkWvoeUNq9fzk/Uhq1T33Eir2U2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1793358559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jLK+qaQYscaZrYd4//xxgAYfZj+tRZQQLm3D1hPHCHA=;
	b=F66pod3eGDIQahSOGw3oFHjNHFatjt8OhlCVOqfVLm4+SZtVweUAxi5/lX3Huoco4qf4Ua
	K4SmBH8IbVNW20mmBl+fn6tYpry5LnSof1+N7o54GBQYja11ki2q0ltkFYQXo80TdxtfjK
	B30zcAJ5LjudWv+0F4q0c1dKobmrp9Q=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AC23D634C4E;
	Fri, 30 Oct 2026 13:09:18 +0200 (EET)
Date: Fri, 30 Oct 2026 13:09:18 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] Documentation: media: Document impact of errors on
 buffer fields
Message-ID: <auR63iwOm_mih97K@valkosipuli.retiisi.eu>
References: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>
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
In-Reply-To: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Fri, Oct 30, 2026 at 12:38:15PM +0200, Laurent Pinchart wrote:
> When an error occurs related to a captured buffer, hardware can produce
> less data than expected (or no data at all), and timestamps may be
> unreliable or unavailable if the device uses hardware timestamping.
> Document this in the description of the V4L2_BUF_FLAG_ERROR flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> I've posted a corresponding fix to v4l2-compliance in [1] to relax the
> bytesused and timestamp checks.
> 
> [1] https://lore.kernel.org/linux-media/20261030103717.3098080-1-laurent.pinchart@ideasonboard.com
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 94dc2719e907..5a7a1511cee7 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -503,6 +503,11 @@ Buffer Flags
>  	streaming may continue as normal and the buffer may be reused
>  	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
>  	called.
> +
> +	Depending on the type of error, the buffer may contain less or no
> +	data. In such cases the ``bytesused`` field can be lower than expected,
> +	including being zero. The ``timestamp`` field may also be zero or be
> +	otherwise unreliable.

Could we say that if bytesused field is non-zero, then there is a
timestamp, but when bytesused is zero, there's no data and probably no
expectation of a valid timestamp either?

In the long run it would be probably nice to mandate the timestamp is zero
or valid if there's no data. Drivers virtually always have an ability to
get reliable timestamps or no timestamps at all, but unreliable timestamps
shouldn't be used. This latter bit would be of course hard to enforce on
existing drivers.

-- 
Regards,

Sakari Ailus
