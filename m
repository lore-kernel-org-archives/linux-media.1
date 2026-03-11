Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B83DFC9F;
	Wed, 11 Mar 2026 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247613; cv=pass; b=j485Zig5bWy6+2mSG1rQ2YvhfXGRTPYf0t8UolvJHyFAH3UkAyxdl+GQ4KumHIPf4rOhUEjxq5zo+WMomMVq4lv0zowKkHMVOCMsDc7h0pAdOa2MSDCuZ5ng0rb6HjLmQ4lJp6zpxGyoCbz8FFFTltTmXEBp2v+k9sWk26sGqE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247613; c=relaxed/simple;
	bh=gDcH/rnzwUEMuY7GjTenjjmYSfTLgUg/UYbQvmv3zTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpHjzWCEpm5QPvFuoQoJq798M7nX0A/h9Ev0hrRd+LbPBJnVZV//Pt7UvvZqB4ajkFiqzXp5NTS8ySioAJGoNmKO34TnLnh7o0rXVjFmpak1Ek5GvQ/64aL6ytf0/YIYnN4KBuHzkEr67vZYOXUqgeUxqbe5gt/QpBI3/1Sb+20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=jDopMxI5; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="jDopMxI5"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fWGqY3FrzzyQc;
	Wed, 11 Mar 2026 18:46:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1773247610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1UO2PugcE+LRO4wineDLS70Fn1lmBzBxjwAjFt5uilY=;
	b=jDopMxI5lDj4+goPkgCvgXMtc6lzhR3SOQl6AkadqWJQs3VKLrRcgV4+sXN7+EUTvWaDip
	h7Q073cnTU2rJMV2OHEfBvM5QSygMxRBDsj6QzxzPmyXvz1ZOvhouIUP68so44yUs34F1r
	bt23Y3TpN2D+hWdbG1xlylfyxphrqhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1773247610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1UO2PugcE+LRO4wineDLS70Fn1lmBzBxjwAjFt5uilY=;
	b=Xufdvb8BI1OEN8BsN+ufBKqr1nYtP2UwT6W+fFgiVFmZqtRlLh4MxEhQvoGPzi7c8y9UVS
	4B43ST1nhakuutu7/nyeE1/cxY74Fon1lpNjHB7OEyyTm99BoDAuZ3HXELbN4Tbwiummo5
	wJMhGZO+ZWOBXMSuImpPTAEwkHPUr8c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1773247610;
	b=Ndy6C64LEjAGZTuU8wFhPtgwuPaoXq9uiNz2IKVCTO+YOhjbG7T0bH6SqeteL1WYlZA7/2
	5fN77V7aQSv6eKe2QbOn1b7AM+q5WqXNOUXl0/XvyMI1RLqP2KsKizOfbEu7V5NMf77UvU
	HNtOhaM/isrIuBMiiICQWR+hJirZcmw=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B5E3F634C50;
	Wed, 11 Mar 2026 18:46:44 +0200 (EET)
Date: Wed, 11 Mar 2026 18:46:44 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Walter Werner Schneider <contact@schnwalter.eu>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/2] media: i2c: Add ov2732 image sensor driver
Message-ID: <abGcdD-gdpIlSOTR@valkosipuli.retiisi.eu>
References: <20260311-ov2732-driver-v7-0-2e036d7b679e@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-ov2732-driver-v7-0-2e036d7b679e@schnwalter.eu>

Hi Walter,

On Wed, Mar 11, 2026 at 03:30:45PM +0200, Walter Werner Schneider wrote:
> Changes in v7:
> - Removed redundant parentheses.
> - Removed endpoint check, see Dependencies for required patch set.
> - Link to v6: https://lore.kernel.org/r/20260105-ov2732-driver-v6-0-95c1b0b0ba7b@schnwalter.eu

Could you post a patch on top of v6 which I already have in my tree, as I
asked?

-- 
Kind regards,

Sakari Ailus
