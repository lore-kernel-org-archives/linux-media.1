Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3430455623
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456523; cv=pass; b=bSCCBJHwSu1Zku0qAWmShaVzSlLrDDiLNJYfICjoUlkHchvZWRGr0xFudfDUUHUWJnVnzQWzvD5l/WY/LnxpquABYIAxhZ+EujTRMXGc+cQdVHgHtyCiK0z8u7nsS++RyMplwA7TyOdMG3ZDHRGrUpXTH8NIw9zGfL/PCuvbaYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456523; c=relaxed/simple;
	bh=JtohjYMLFp+PuVGGtii7Ov8M9+BDXaCo/UVdLrWfd1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erUpeAtfi4Zn2S4DLvXvyHjphQe8EEuvtinG7VpALZur5/I7E5aFKM+X371wSlfjtMTa8RYpTdo5ZIxIrnjZ/9iFXVBZ4zEYStw9nk1uTapNJmTSNPZ0XzGIs5+0N4oEu/iqGDmGHYZovBfmTzkq7//9acKdTeeG34/glpT6cxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=F73VRlcY; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="F73VRlcY"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkYFF3Z82z49Q71;
	Tue, 15 Sep 2026 10:15:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789456513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rM0Ov88nB1RHwmllavReHbjT8c+NC3sQ0QSkU4Om50k=;
	b=F73VRlcYuDJQsNDc5M4JASDWMr1I8f0gxn3GSA/PK/nR028tBlD2GnznKEPnVw3HJS2Ir2
	FADAjpiG0zgZECIlp8bWNoJI7g3JBAQa+mLq1sscxWEBEJQJ1OIEG467EMBdHhWyBKubc4
	Q7MIUghpAcLJV7mGcZ+YnMrQtchY8JDDbVYfyuKXbDZ1u7f7fCQotHZE6Toy5hrMbRfp2Z
	NEE+x/ghOzz6TfMcjQwW0nFQHUpqX9Ss6z/TdUVM711OuVUOOPLFxHiZjIIt+epuoJFdMf
	Pg+O4i3Yv8pM5dBE1/XzlbYJ9NygGRXBc5ziEBCpIRBD3WiB/HRjEwtl78X5PQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789456513;
	b=Tx49+2y1Vwmlw35eZGgGXpwyerhD0OCPED+JXldyaYVHcoaI1x1rYRCqeIr29tkCxQn0Ou
	6m1rPZ7Ms1JheIdi7sCBG5uZ7H3v0YY91IFvwntxYWlm7eBzq2sWQ9zlqYp0sooSo3+7vv
	UNlyzn1ns/CEeqkSybUaneAfv1O6xED8jssXFY8XqKU2JOkAewijdow8udBuuh2uqq25Be
	xWTyB97VLLuWz+apSpxDLHo5gga9EyxYYVfj11nVA5+L9FQjMwBbKTZo5QfuBUvpxbhY62
	z/2bYrefuqibFMWQ5GMYB5UE1NVlty4dFCAA/QFaEhr/zA3ZSTBb1q0J44l/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789456513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rM0Ov88nB1RHwmllavReHbjT8c+NC3sQ0QSkU4Om50k=;
	b=dw1cuC22LLGQ16VexPuYzU8IcyjKfBg9WRmAbcplhqJ1RSAsp9UHq0uCS/f42lrbuNyUxe
	lgCp+6D06JGYwgXcFnnjztlhsUDuUDv2FUs7Dksh/8mJlRsnKCBWY4nzsI0Up6u7RGWpnX
	yGIxDZ964VwIGa5VjAIQ2TL2b+btuaYpLU+8aWYapb0aL5/9DeqnpsTWsIFMpFionqAKIl
	sP2PsbjgUDAn/kT/MTpI5YBTH0DWnbuto+6cEb+4rdK2mJQ/bnvqEAP+LZChreMSqIsbgA
	3cN3DjKymGyTAGY268uM98zZG4zqgVyR2rLud/s4mxaP4wPTOWFAPYtlw3HPzg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 73686634C59;
	Tue, 15 Sep 2026 10:15:12 +0300 (EEST)
Date: Tue, 15 Sep 2026 10:15:12 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH 09/21] media: ipu6: Start streaming once all streams have
 started, stop when not
Message-ID: <aqjwgHXGU8RI5yYk@valkosipuli.retiisi.eu>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
 <20260914205358.735307-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914205358.735307-10-sakari.ailus@linux.intel.com>

On Mon, Sep 14, 2026 at 11:53:46PM +0300, Sakari Ailus wrote:
> +	desc = v4l2_subdev_get_frame_desc(remote_sd, remote_pad->index,
> +					  V4L2_MBUS_FRAME_DESC_TYPE_CSI2);

Some intra-set use of v4l2_subdev_get_frame_desc() was left here; I'll
address that in v2. In the meanwhile you can find the set without
v4l2_subdev_get_frame_desc() use in the ipu6 branch of my linuxtv.org tree.

-- 
Sakari Ailus
