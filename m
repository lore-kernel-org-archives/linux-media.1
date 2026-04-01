Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB94611FC;
	Wed,  1 Apr 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060747; cv=none; b=Zykm6fhxMEt40dDigDaNOZQUSjJKYrb8FJBqw9JbyY/QgdCDJdT8/O2jAxFpQQc5YKS2hL4ApJzVKwh47DUk0fPyO4cpsDUoj56vdcm7+DNC2Igj4M9Jof2S17nBnYNCNxOYOFmYzJhzPCgTCpjIAB5Ot3QRqJKBytO/P2XrbKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060747; c=relaxed/simple;
	bh=wpnjhx/C68btOAdCBWC8ZJgFz4cAl1hElwC12d8xbmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=m4KuO/bUF7F5sKej+uFS3gAdnWdE7HUggWleokw6d3aevhGZ8C5gEPPrdCtIqKyPogc8lbsFneABbCgxIcTBEFwLktmasJVyyE3XoPRXX5m0gjyD0cHavBjKrKE6fojUDWy5jBQO/Zg84AsJAnHhC+3V0/YC2ZmVqs1bI51F52M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=AW2WpwAg; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="AW2WpwAg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wpnjhx/C68btOAdCBWC8ZJgFz4cAl1hElwC12d8xbmk=; b=AW2WpwAgZJJyoh+NItKgrha/+P
	fyvQFIJ9C3Pzgq4jgmg8El0cz+xyraDZYEBCAqNphc3JH4M4UhCxOQr7EDH0VKV6HzKG2y6ljvd7l
	SyvU41aSDUHNmyDR6C5+alrjhj+6+P8+uMsbuJYsjj8bqvfaYYjVO1whhXDRHRlk0fRU=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7yNn-006hhJ-06;
	Wed, 01 Apr 2026 18:25:31 +0200
Date: Wed, 1 Apr 2026 18:25:31 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	stable@vger.kernel.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v2] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <ac1G-zhysXIJcOO9@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0BVwO4XGhzcMu3@kekkonen.localdomain>
References: <20260325093241.1441512-1-mnencia@kcore.it>
 <ac0BVwO4XGhzcMu3@kekkonen.localdomain>

Hi Sakari,

Thanks for the review. All three points addressed in v3.

On the exact default_mbps match: yes, the range check covers it
since default_mbps always falls within [min, max] for every entry,
so the early return was redundant.

On the early exit: I adopted your suggestion to use separate
continue/break, but swapped the two. Since both min and max
increase monotonically through the table, mbps > max needs to
continue (later entries have higher max) while mbps < min can
break (no later entry can match).

Marco
