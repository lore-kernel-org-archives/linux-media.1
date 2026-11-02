Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793616455;
	b=1Ug0vo6tXbm69ZCBaUEfI14JdbJyw3F37cw0p7++D5p81UT2DV165fmETAuqsPR5tGE6
	 dW3yuRSVyXkSU+Xdsjs4v5QCDldXJUyVZJ9T8Il5PAWm40Cj8iRArf/lLQOnruXT0+rsz
	 dy7Yiq76PaKwqQ5ZmL/z8Ap31BJU2wv/QSRyMNGValhuVSI0RQpDUtv5mh+zykUWFWxp8
	 P6JQGi8rX/C8W3+nQl41exrJ2rnZMR6xi2WyV39QjnL36OoRa6H8ZMPxXjzYK1WzqoCGy
	 QgNlyngcdnbdE+U+pAdAtO1EbDSuMOAa/x3JACglibgTRRqxGsJ8xp0c3aeDunBdohw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=U+oKN1oDO+YOODIA3onQYPDGF8xQtNAmj9KwmSFAX3w=;
	b=VagBMxIpoy7VHwsy/SfmMTS0iKUiY0VZhwPEN70HtzwnW3iS7P6CcZImthI9Dg4DOnMB
	 6tZ7BxN+3xLrEGix4HWCXXY2PjN26eb1V6bKSOjBG6nGx+WWQ7rGvPhbVBax3FJS/Sn3m
	 Ahfan74V/FeY0mFLGzeCp0uPZiW7K593O9oNqt0bi3lzzSZ6D2AJUix3uVHMOI4Pvw+mS
	 /0hyaoaJjN48wG8Uu37tFbWtj4AQyJpNc1i/Gvh5Sw7PpcVS0y0KbsBZzwkSuVvB6zxNj
	 h3Zru9dZ4JUVGGFEVnZfK0Sgi1cH2EnNUfjrgY5DqLGarKLXmXIWO/0M6bw+uxTo5+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=rZmBM2MV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD39606A336
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD39606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=rZmBM2MV
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4jJ7gt3Zd3zyQ6;
	Mon, 02 Nov 2026 12:47:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1793616443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+oKN1oDO+YOODIA3onQYPDGF8xQtNAmj9KwmSFAX3w=;
	b=rZmBM2MVx7Mpobrw+S/RpUJY9AmhFKSSlgNHu/Mjss7EtDHCwcmpkBCLnkf96dFUVczMLK
	53yJOuCY6qtLXe6tLB1YflOc2o6CkvJGJkdgyQ9k2wZ8Du+/dZNQuExTTfClmpuICHlbGE
	FeLt+lhGHSvMbSioPDbCTUiXnJeKhGI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1793616443;
	b=PhuJsVZV4UFCdKfsK2gQnu4xROwg2so4e47DSbvrDXzZLnI9n9lZKozafc0ngr0GxyQJOA
	meEy316pRETveq88fHcEWI8Qm2pXyj/H+6pMqAP36pl4Y2Jn/EzELdaoTixtfwAFDBE0DC
	4VLH3+91kVmUhxjEb9GxeeHL1VKVK8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1793616443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+oKN1oDO+YOODIA3onQYPDGF8xQtNAmj9KwmSFAX3w=;
	b=bF6nos/oGk8LU4qPwuikI6MGHhZ6W3iRmcV4aTkEnousMFIL1QhPNkAAoBcUu4jHOubZkF
	fNR+gDJt9YnSvwq/MuvpXkewoSaUVrWBFSADMzBb+PsWAsX3qe7QIQg+cTaj7xgj+c1Lyq
	qyb38gFcEwQZzRkxLoT/a7w/HVBQNRg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B48C9634C4E;
	Mon, 02 Nov 2026 12:47:21 +0200 (EET)
Date: Mon, 2 Nov 2026 12:47:21 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Alain Cousinie <alain.cousinie@laposte.net>,
	Milan Zamazal <mzamazal@redhat.com>,
	libcamera-devel@lists.libcamera.org,
	=?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors
 on Intel IPU6/IPU7
Message-ID: <auhqOaZmN09mxkqv@valkosipuli.retiisi.eu>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
 <20261101164311.GA3368923@killaraus.ideasonboard.com>
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
In-Reply-To: <20261101164311.GA3368923@killaraus.ideasonboard.com>

Hi Hans, Laurent,

On Sun, Nov 01, 2026 at 06:43:11PM +0200, Laurent Pinchart wrote:
> > So please modify the ipu6 kernel driver to not report the packed
> > framebuffer fmt for the MEDIA_BUS_FMT_Y10_1X10 bus fmt.
> 
> Better, fix the driver to handle the stride correctly and not stall.

This looks like a driver (or firmware bug) while the stride appears to be
correct.

Hans: on which system this has been observed?

-- 
Regards,

Sakari Ailus
