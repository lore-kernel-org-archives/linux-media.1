Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7626C3BD;
	Wed,  1 Apr 2026 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027524; cv=none; b=mYzVDN4bfi7JVbur68JMfU2W2yiiyCk/arM/vZEJGDvvWNWFCElQWA7FVbVoZ/vekHjYwD/kn+E+XBMXfnP0zjP0+q0tA5NR6gQ2J82OASlTJ3lU5rFzn51YRolJr4qZh6c2GOuotMB8uyxcRuv8fN9OZMtKSvsCzBnGWl3XPKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027524; c=relaxed/simple;
	bh=cBGliewdJJUADavazV6ZvXLVcK1PVnXVyMKwTsGTasA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=iCKeMVRA55xO9g+kfNQVJyTZdDM9rQSBcRLsc93vsF/S1qlwyE2xWHmnLvuAjZCiu55CofBX2WgoAsp/wHJKf6Kh6G+PmjTyLuPToep3wy5/8TCqKvCpbT0bBrU6gEwkT09atXCWUotVgDLbC46SQ1xVWHKPBMvL8M2HuiGQa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=AUYclloR; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="AUYclloR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cBGliewdJJUADavazV6ZvXLVcK1PVnXVyMKwTsGTasA=; b=AUYclloROaFf0JmovIozdriWtW
	DOlGQOdN79C0Q6JDOCz0KlED19ldAXFXLJVyqgjAFHKTpbAonh9Up+YBVmJETm7x83sHu7PQL4Roc
	p5SxNkswC3CYaaXCGwegFZ7/aGSHSQ/IeSQG2VJbtCkBJidH5gLbnuo1hb4DODjuR8Fw=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7pju-006f7I-08;
	Wed, 01 Apr 2026 09:11:46 +0200
Date: Wed, 1 Apr 2026 09:11:46 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <aczFMjPPs-KzxOBC@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325093241.1441512-1-mnencia@kcore.it>
References: <20260325093241.1441512-1-mnencia@kcore.it>

Hi Sakari,

Gentle ping on this patch. Any feedback on v2?

Thanks,
Marco
