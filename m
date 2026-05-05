Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884083CFF65;
	Tue,  5 May 2026 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984772; cv=none; b=TNwcta20+g9oV2IDyDzkB+Ln6cKpAsrSipfqOaT+eEnI3F9DFkzneuZNKnQxWGz+DtGbG5YMa22V1qXD/nWvfCojWf5RO2Aa0Gz/zoPXUwpb2Ph8C6PFJrngJ2DvV1qdXcJhR49Rsx1yO5uFW28PMJoDUMYSh5eDsohohaZzNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984772; c=relaxed/simple;
	bh=ytaP5d2/B9dqn8WuFceloqmXmS4LpSO4wlwSQGJjal0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=dlMwRM+cP8Z1dWxo+2tPpFhTegbzkpO0geupfI8sB/G616SNZqi7XORBZJeNPK4Xs9ZMb6NjZ+k+DNl7K+/10ZyO7z/eN4NGsOUthQMaFmJZm4lkX5LBOQm+0rnGL8m2lny0FhR1inNqbBu5DqNxPmP0hSHFxKP49yFTpKq3pSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=oZc5WdaZ; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="oZc5WdaZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ytaP5d2/B9dqn8WuFceloqmXmS4LpSO4wlwSQGJjal0=; b=oZc5WdaZyzU/7FeVNDdjPNdeyZ
	bGL9rBkg0gH0drndtHCMHAItZjWWqdqM8WV6E4Gkyf9IkBDIVzqqFhPHo1GL9iqtUqY1P8ufdL81/
	mrKepa01/jBrC0rC0RNdDCau518JrN+z3JbojAAWO7smpuAq6VEa1zY48Xerx+dcrDFw=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1wKEkF-009bGC-1O;
	Tue, 05 May 2026 14:19:23 +0200
Date: Tue, 5 May 2026 14:19:23 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	andriy.shevchenko@linux.intel.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <afngS7fAsIOyQMrn@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adatpTA0MVtaU-eD@kekkonen.localdomain>
References: <20260401162547.1597975-1-mnencia@kcore.it>
 <adVXNx8hW4CAY3O5@spark.kcore.it> <adatpTA0MVtaU-eD@kekkonen.localdomain>

Hi Sakari,

Gentle ping. media/next is now on v7.1-rc1 (and v7.1-rc2 is out as
well), so the gating condition you mentioned is met. Let me know if
there is anything else needed from me before you apply.

Thanks,
Marco
