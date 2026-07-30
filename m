Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D055368D45
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429971; cv=none; b=lNaXJW0MC57ehA6jdrMeyF2RmiYPXAWspNgAHnzO9+zpOyRbSCZhQqGqMrKYw2lzbnm5lBUZTXH0mDadxro5lTwItQFogIx+Fo4ITLzRSUOB/quGaj0jCaGaQlPo4jw12Gyc8dSI6FSh1HYQYfpaC3A1MOdYyKDQMYjZHcwWIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429971; c=relaxed/simple;
	bh=ZAs3k0ZvOc1D0wh9G3ZY7S0nZrMDuIeSI7fMUiNw0MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVy9xk+mY1GkmNWRbc6oP/1749873+3yFxCSEDujES3OJLnsW/ELqkk7602ieWbCkcO8fxZ5Gz1e4W3xdAe7EbHFl6r3c8HGPVkY6rIx8PU18QYIY1RYmcioSTIZ3BvVDEK/oMTi4ek/uFDvQU83odEz6YT6jlcFliMdTVnU3iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VHNHpkjU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VHNHpkjU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cede6375caso205ad.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785429969; x=1786034769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NX0JpvyzsEoK6j+vmZOEXvLrdaZX+FAFLPxJGdbTFoM=;
        b=VHNHpkjUYAWJTdMZxJVTie/KgINuJhvjdC9CiaMMyM4tQ0erUo2LcRwxFG0W5cZYSp
         MT6iQOSIeMxPIWY9HPmOHTSoQs9WDqZjUWXXgDk51FdYl4mijDYpTY3fA6sQukPQWPzB
         BhE/HfukIVNUHPCvZTX1qElePKssMtJcwlHIAqVPrcnVBjoQlFL/Pi+WZNYZ+4FyQJVf
         Z1EbKFjNKu3UKhlVrjMTfL/vQyMVswai0c/upzzn1ULt72xG3TnRY/iCFJbcjTIzfM9b
         E3tC9mEioxIrJneX6O3pMmA/9B00v4cvmdmO7cMLamxCrOaWzDHe4UFPrP5qWaujS3nj
         VEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429969; x=1786034769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NX0JpvyzsEoK6j+vmZOEXvLrdaZX+FAFLPxJGdbTFoM=;
        b=KprkCCLFJEXyjrfASxZk4Ab+u5H8hBbmhrbGQLr7MvnNmifmvYwzYIuDpeyZrozubB
         f6A6F7pd7p5Jx6651JP9rzy4Ih6MazrJ8ecmMXdEjVU4mDD23N3ezWcoroO0exHHJkS/
         BRsbT06NG23tVYmA1RSoRCISsRLZ9E94VBJ86OdSyRyXeidaG/HLVEOtVq3pJBh41cod
         DHHgLgeYExvSm6vCkGd3hAIMDin+Qxn/zYhZX3GE4xdgXfImgBjCxfNjymJNCYx/+d/y
         gRJ6aZFBG6IbqTg6sZR2LpiiP6Q1Uvzf9eIWNuyCLiF5YFODQ/FXKUrmenJPpohUgZgA
         Hnuw==
X-Forwarded-Encrypted: i=1; AHgh+Rqg65lZA6ouraka9WcmCXCiYRsG+p7LEMq4HOVaoTmLN5/7TceQ0Qgu0WqF1YYaPjdLBmfFCtg69b8Dlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1giEze+hXApU+tV1kt/8n3W4vomWanZIzonrKdBfaCSa08Aog
	1cSBxbhOwSevTv7hL73qVOS0ZK7EsT24mgK75e5UXitFpdwZGYrpY6wWghVuJ+03fg==
X-Gm-Gg: AR+sD12K1s70LbHJXXHqJEUbLe6y0HxL45to1Kd9e77vyfkYwaSC/H74oajoFsrHDR1
	xEy8QXi6p0RZhw6BAVEDKpq079HNfncSKESEQ8cVyXZ7jWsO/Eg4lnDplbbLtU1nd2BH0aRR9T1
	PXS7Ds4RkLVLOsMnv4eP9K/3uERJGIgTrj/mRb63+LHnDkjtERjOuLTR2bQlq2YinAnckuBWZRZ
	KBbe7bPAbzrtUrdWuGglf45aN/QklT1cjRuMk1qcDdaDTnieDg+K1QEkNl1zIAwGV8w0biww7Xq
	n8eeExuYRRhAKkbOKKc4LT+X0b+l5Fx1EKGfzI/46L011IeaykpHdzcHLCILXGtyuvZ1grdWNS+
	Y8bHBGZHGYYu2ODH0bzcWmk5G69rd60P/N/Gr8Rhz1VlUOCyB2c9HytrS2UmtbT20durCM5mHts
	/MXeECM1EbwaZT6npPP1HEs/dwFx8iBW6Jz2Rhd/7qEE0lLfhRI68arxOVXQC14WV8if9xPevpF
	wOqUoEplUnvB3mw2vvwpww=
X-Received: by 2002:a17:902:ce90:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2d040c826f8mr102235ad.8.1785429968232;
        Thu, 30 Jul 2026 09:46:08 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa474sm3347122b3a.30.2026.07.30.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:46:07 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:45:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 1/9] PCI/P2PDMA: Split pool-related cleanup out of
 pci_p2pdma_release()
Message-ID: <amt_x6-9lplDLdHZ@google.com>
References: <20260715174737.15287-1-matt@ozlabs.org>
 <20260715174737.15287-2-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715174737.15287-2-matt@ozlabs.org>

On Wed, Jul 15, 2026 at 06:47:24PM +0100, Matt Evans wrote:
> Preparing for a refactor in a subsequent patch, split the pool-related
> release code into a new pci_p2pdma_release_pool() function.
> 
> This allows future compile-time selection of a null implementation for
> pci_p2pdma_release_pool(), when p2pdma.c is refactored into core- and
> P2P-related files.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
