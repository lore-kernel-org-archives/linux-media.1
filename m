Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D907E3B8921
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906663; cv=pass; b=llw+468hKdRLtnbTMLunyX53cnXsATAAfY5SVH6wPvCAylRalyE12ODbO6fTVCkF8UBabJcAbeE4avXWBALN4jhYAdgBIvo2o1fn4hr3xXQN3cdaxfP5LI+2+4vWc3ZwKeLSZOrRfyWEDPVstSKWtekj0cfwRgKL3sJF2A6aBpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906663; c=relaxed/simple;
	bh=rp+vfNo2k5MJJClNooE5CxctRB/V7+bdmZgl7cMCLeA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FgOWttdeAfX0fpypAJZae9LrTur5MVfvO+w5AJSuWa8vhGNoQC/1jfW6WvmHgGmZRsvEvOAiOuzpDjFaTvK8DsKoFlbOgVhKw/rvJHNoqs3EB6Aim2WQW0FLw03P8l+pDmWfaA8PIoK6nF1VUI9fsKUgCFrr3jakizMyWRsXgKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JoQX+zda; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JoQX+zda"
ARC-Seal: i=1; a=rsa-sha256; t=1779906656; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U/d1egMo+GP4gwk3w19aZZomjkf7o244d0adp/PJuO9RnbxhlZQR82Gjyd3Ht/eVRbI1E/GyUCexfN5//IHYyDg7rrzWIGLkT+7dvlQgYF7Eic9nnimN9MmlEEHZviCflgRzgOYyOEYGxqb0g4YNi0TT1xYFSzabCDciLH7f+Uk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779906656; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rp+vfNo2k5MJJClNooE5CxctRB/V7+bdmZgl7cMCLeA=; 
	b=JAaE3K+N/Q7Zb3aLYsLXhYWobe9CxrPgIdk8cK5pGv0yFxK1mjIWwt0EoE6Bm1U2g7s+kPlLUYBbMFkCh7Z0u5+UE76y2GiyuytsPXarngolGozaArzX2ZYcJYUzpbKvq9ZEFgyfdcU/ITDG1kxeCU3OyGFoH6GFEtFB/msLKoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779906656;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=rp+vfNo2k5MJJClNooE5CxctRB/V7+bdmZgl7cMCLeA=;
	b=JoQX+zdaH8AhjbNF16KrkBY84ovxusN+P8cgtQW8DJAxwuRp+zMnDQSgBcdsss9r
	Klw3hFTRqGjoywVQ9BOnh1mXqeNIm6syNTJ91rsFwxk8Qn573DE2bveWUMKltf8gcn/
	nOWY0MEsd1E63sM8Z6Sa3YboCeReIQp8TyUsHFIQ=
Received: by mx.zohomail.com with SMTPS id 1779906653816245.45689310881414;
	Wed, 27 May 2026 11:30:53 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [patch 1/1] drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <14D4F3BF-744B-474B-947A-2CC52D9EA185@gmail.com>
Date: Wed, 27 May 2026 15:30:38 -0300
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org,
 mchehab@kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <83B3D050-6FF7-4665-A46C-E76447BD13BE@collabora.com>
References: <20260526222709.608471F000E9@smtp.kernel.org>
 <14D4F3BF-744B-474B-947A-2CC52D9EA185@gmail.com>
To: Daniel Almeida <dwlsalmeida@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Oops, wrong email address...

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
