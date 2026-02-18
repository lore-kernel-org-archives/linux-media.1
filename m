Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D90223DD6
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 21:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771450251; cv=none; b=HT8nc7iGUZ4CZx7huGYl4GqyTndnpbVBwYr9QiB3nSvMnaIVA+iIygMu4aBccJ2phGUpTTgyc5if6a2JCElsgNnRMqBYYp74g7JChYy31nk8qd46cf7t7nIzG7q/R1SixvxiLKklyOQyNWLH7S7XPeMqjCdjkJ5C6e341K9C9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771450251; c=relaxed/simple;
	bh=pT3NI3tZ/BgXvcF1eInOrdkg6r6wdfpK1PJw6bIneX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC8ikfXkXC6eiH62Osy22o8c+h2F6V55emNbYSWSF3q4AmJsoOWXyaYwjFQx50FhuSQ2PJWV6UPPqBym+H9H8FycPN/JIBRxRVfQGRWg8Bqi8UyVOnSmwmccvS2SgaOqfYaIRO/KbxorKD429f2ls/CWmFqR3roJIwdWfECzJ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BCrgGpGQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BCrgGpGQ"
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 70DB650A;
	Wed, 18 Feb 2026 22:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771450194;
	bh=pT3NI3tZ/BgXvcF1eInOrdkg6r6wdfpK1PJw6bIneX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCrgGpGQcCa6WJrbkhWG9GWWc5vTBjAbtP83fXmG4rAf7hLJDV0z/xMCPWPTktLM5
	 dv8vwkURdVPtd/3vaEarqyP3It3YkpbSYwUYy+puxT7zyS1qGNwDCkZWfIu59B7MEx
	 xXMDNQebuxHEDJPOHSQL3wipTB+YjTCxdCSxyhQ8=
Date: Wed, 18 Feb 2026 22:30:43 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v3 1/3] Add explicit switch fallthrough
 notation
Message-ID: <20260218213043.GC57525@killaraus.ideasonboard.com>
References: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
 <20260218083424.2432541-2-sakari.ailus@linux.intel.com>
 <20260218102618.GA57525@killaraus.ideasonboard.com>
 <aZWgunfrSSxxTXEA@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZWgunfrSSxxTXEA@kekkonen.localdomain>

On Wed, Feb 18, 2026 at 01:21:30PM +0200, Sakari Ailus wrote:
> On Wed, Feb 18, 2026 at 11:26:18AM +0100, Laurent Pinchart wrote:
> > On Wed, Feb 18, 2026 at 10:34:22AM +0200, Sakari Ailus wrote:
> > > Use __attribute__((fallthrough)) instead of a comment this is taking
> > > place, to make modern GCC happy.
> > 
> > This will require gcc 7 or newer, which I think is fine. You could check
> > the compiler version at build time and emit an error if the compiler is
> > not recent enough (and you could use that as an opportunity to switch
> > from make to meson :-)). This is of course out of scope for this series.
> 
> That could be interesting. Although there are just three .c files to
> compile, I think make can do it. ;-)

Yavta has a single .c file and I still moved it to meson :-)

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks, but the patches have been already merged. I'll use this for a
> future patch. :-D

-- 
Regards,

Laurent Pinchart
