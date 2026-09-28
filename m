Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA643368B0
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584674; cv=pass; b=soEkiTSts6PonI9LHKbApMWT2fujMbs6Ox8KFwL66mSaloYSVxP6qrqrrWfF5CVAb1bq5vsll9OFHAlqNTv8ZuMPa3vOeSTL4sIUikjk2QK8A26notecVvMiHwW9VBHT2+FCtRXnwdVXUYNx9rXnpQ/nspG8/FlHCfXBVIBoehI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584674; c=relaxed/simple;
	bh=4MNxfe2COSIsrC0hanFOhmM3r01Oa+Ss2h/hrp8KwXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wghgr9vZshhiNdDpT/S5syNe1y/VeLMqqRuI6Woqsp1Xz5tPE27aNZcJS2yPdNs3//8oZ0tfVZODV1hzEBaJTFBXrRQ/9QmNU3n/iRX2Y8lqmObrazs3F2B/Fe1iiD8Eck+opGuxjE4mSWii7suj3BwspJYYd9GtQF6RRJcDbYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=xIyWTt8H; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="xIyWTt8H"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4htZST2w8lzyWq;
	Mon, 28 Sep 2026 11:37:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1790584665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tqMPgvCRAVeZWZ6O+oCu5qOBkkKVFH/GowYMS7eA1Cg=;
	b=xIyWTt8Hb3fTrElOzGyXYfitWW2Ol7q73tD3xjPkApZla0ZDHaB+IfZLfJkXrJGpdVD5c7
	D79IafecbM2pxsszh5Qwqlu2W09vbqSUrS8gj1f/BX/M40ZmRnKwx7D5gSvMjW9I3/wHj5
	7ubHE15sYkpHwVmmoTsQWrE/nFMqbLA=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1790584665;
	b=DphMDYSwnJJ5fxmPyZeJ2FsIZGoSunepKznn2c+g1YaTwq0labp5WtR8PzY2whBGSQch7E
	voFnTT7oZcLstq1FhaJgxWPmfjL7r2LcArGFv4oXkCCAAeShc3T7NWOZ6cXpmTbOL2gdzW
	i9hWFCLd3w8Mli5un/AArw8EJQdCwbw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1790584665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tqMPgvCRAVeZWZ6O+oCu5qOBkkKVFH/GowYMS7eA1Cg=;
	b=WILAAVAkmna0PWfoo2AT4GGR0JMjvFjBOSPnKxTi5bsBcVwFHk1y53tIntgJ/SFW7J/Eek
	BigIdGQAZTnFCogs44nxgLRlMvnpSZEwvh9II/NL/YSCA7v6mhmgaMD67NGU6YS9WWKJbm
	Jo9I1ELPwxoz5nqOMUO5sZnd+0qT5ak=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 09F36634C53;
	Mon, 28 Sep 2026 11:37:45 +0300 (EEST)
Date: Mon, 28 Sep 2026 11:37:44 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm] [PATCH] meson: Fix license to match C files
Message-ID: <aronWDRbUzKX16SS@valkosipuli.retiisi.eu>
References: <20260921101704.3052292-1-paul.elder@ideasonboard.com>
 <20260923062343.GA18141@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062343.GA18141@killaraus.ideasonboard.com>

On Wed, Sep 23, 2026 at 09:23:43AM +0300, Laurent Pinchart wrote:
> Hi Paul,
> 
> Thank you for the patch.
> 
> On Mon, Sep 21, 2026 at 07:16:54PM +0900, Paul Elder wrote:
> > The license of raw2rgbpnm is GPL-2.0-only, while the meson mistakenly
> > declared GPL 2.0+. Fix this.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> Oops.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied!

-- 
Sakari Ailus
