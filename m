Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725D25B0B7;
	Tue, 30 Jun 2026 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837598; cv=none; b=pK1LnhSsT7p0sn/TjFFmQoO/X8+rEXKsQp0Z5Iw6K4MgKo1KRrLETfIplrGHTtogpTJP6cd1Z5ce38SS8iPhHEjViufyx+HEKQwjzWEM+ko/7mgrn5PVlv96Zc+YPsY/yLes1kutex+XXnCJ+8ywXGCUoLwHYoF5gWYeW26v70Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837598; c=relaxed/simple;
	bh=62Pps94gRIXRxKym5mdviKPCi6q8yM4B6mt9tZ7ALpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ1LQMq3D1D8NW6PSPF3TYbqQkE75RHaBRST/238rcG7zjV/YOMzmNEftfCfNrZZzCtpr2jW60kYRPwNZaDBSeDRd6u00Cpfw8dLL06W8pMZ2HYl7jMYS4NhTJLokrY+RNQg/oXTNwa2EjRNEeg64WgeWR3u+JPwVflAKadqoXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=EbaKLHDH; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="EbaKLHDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782837589; bh=62Pps94gRIXRxKym5mdviKPCi6q8yM4B6mt9tZ7ALpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbaKLHDHkfZ+RG9y1FeeJy240F/CWdrHRnc1kkfvgethjk7wDidEUzEFHpY5AlL5y
	 ThN05uFWGeDImscud35QuYO+2007X1wKYONTaIsQ7GhwoeX3xIxjCON9Q7PCzoxZP0
	 ZnmrcudowQgTstoZphkELy+BW113uE1zBV3aJynrw2DbVOIM+U4q/vtmoWl4gJA5EG
	 XVLbhiIEP2maGeu/3SaKfcRoo15LTTMZxWZgSGsym0yUta7FQTKnrGpkpWCNduUtNy
	 C6OUDdrg1Cm5V6vJy1lvX/LztZ/uDXe2h3gs5eajblci0qMiThnXMM4fLBCCVQEwlZ
	 v5oJTKo6MgogQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 0969D41567; Tue, 30 Jun 2026 17:39:48 +0100 (BST)
Date: Tue, 30 Jun 2026 17:39:48 +0100
From: Sean Young <sean@mess.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: dt-bindings: rc: Sync keymap list with latest
 list
Message-ID: <akPxVG7pA7gbN_An@extorris.mess.org>
References: <cover.1782300922.git.sean@mess.org>
 <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
 <akO_XqVQ-S72dveD@extorris.mess.org>
 <20260630161703.GA3798331-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630161703.GA3798331-robh@kernel.org>

On Tue, Jun 30, 2026 at 11:17:03AM -0500, Rob Herring wrote:
> On Tue, Jun 30, 2026 at 02:06:38PM +0100, Sean Young wrote:
> > Hi Rob, Krzysztof,
> >  
> > Could I have an Acked-by: please?
> 
> You can look at patchwork and see where you are in the queue. No 
> need to ping us. Plus, don't expect quick reviews during the merge 
> window.

Ok, understood. Will do next time.

Thanks,

Sean
