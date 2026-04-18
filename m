Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DE2347520;
	Sat, 18 Apr 2026 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776550858; cv=pass; b=JMrI/veXPWbEIlIjZIHDHJygkmMBdGWYgF3y5Pf3cJ08kEM1ISLt3aDVx/aK6jkN0dHd8RcjCf7HvlhkPFDKlunOrSbRwmg078vc1GIDBSdmPK9SEgqyCRNi5uS70HwJYbh+RDBJMVGmrFT34CY4Ym2u/i5VnAun91x1lspbI2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776550858; c=relaxed/simple;
	bh=vRk4BgUywg++B3oNKmCuehfo3RD+PBgIIRvowHAghiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBrsceKjfvvdK0bUHHSUrrR1wlhDQGRlXBfGYbFUaB3jsxwLODG4Qu9RGL5ppOAeOKSegv++EMrVNDDb1qFcRqm8Ttbkx5op0YeJWgLYv2SleaJl/Udtate2qt7fRQSkR3Ddh5bHwN9IQQbBeDy6NLuPXB/D3r/5HBIVjXH9WP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=tctpaG9N; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="tctpaG9N"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fymRT5Nn9zyR8;
	Sun, 19 Apr 2026 01:20:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776550854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQmQVg9ytMn5nzFpaPi1r2FHhk0oTUZPaA2UUkl7e3k=;
	b=tctpaG9NB3ktG6EnDaq3uqai5NzP+eMrzme2T6BgZTqEDLBJOZc28OG3ErxCPEwrULfFwM
	Je/O9yxSd52GhjyVupRjh0BrdSyll9qyKp4TXQIXwLcB0zdPQCeA1/fTmeLdyW2tDJPP9V
	Y8LpxqlOY8/05t1JBbLHdlOzatZyWJs=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776550854;
	b=wur+pex2QDkent03TCJ3iFA9qcmRm5X1Q4RIREhf+ZzKUwdjO5cFqyBWJagHngpxuujaZd
	fH10XpxYiPQDRTkVZMDE1WbTXgE1s9xQAnqwmzIQlXMpXrZEGUSENb8lnpPF/Vg/a1ZCbm
	q9jq+JDChC/I08Y1KIu+23G8oTlzxlA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776550854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQmQVg9ytMn5nzFpaPi1r2FHhk0oTUZPaA2UUkl7e3k=;
	b=nxZZoXDIqWae4tow2NmEvAWk3oDnLwr1QpTg8sTr3ZvMjhYeiXeOAejeIAPRXtYYV/wRmi
	CxB6j4Ge+ysSfIaUzLkm/xRo48cOI6NfOLZ/QFPXar69UuC+5uCST+37PMHoRCimtZThp1
	GbvKFjJMZ/cCJCHK4EXRR4y6UfoF2Lk=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3F09C634C4E;
	Sun, 19 Apr 2026 01:20:53 +0300 (EEST)
Date: Sun, 19 Apr 2026 01:20:53 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ayush Kumar <ayushkr0s@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org, hverkuil@kernel.org,
	ribalda@chromium.org, abdelrahmanfekry375@gmail.com,
	santiagorr@riseup.net, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-newbies@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements
 to next line
Message-ID: <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
References: <20251126190026.37436-1-ayushkr0s@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126190026.37436-1-ayushkr0s@gmail.com>

Hi Ayush,

Thanks for the patch.

On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).
> 
> Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>

This has been addressed by commit 003c2c39ec77c84d704ee8effe170fd8658fde0b
in my atomisp branch.

-- 
Kind regards,

Sakari Ailus
