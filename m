Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE047669A
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453619; cv=none; b=nFFrl1lF81V+DDjC15qOusB9JxoPBq1ITL1NVvjw/ItY3KXbxiKHNZ+bSBWfiuL9GGUeBlHJuu1/dDnLlUzy3z4Cii6ne4NN+AAZXts1mGo0cIkd+hJvF+PMFaQ75HK8x0WGKRKIDMRmm00lr5F8pqKT9qruYm8Ppv7HwtkAL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453619; c=relaxed/simple;
	bh=D1HG6b77iifw3DUMszzZ7R8qVj01yGi3PV2UPXRdquM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PThJue8vHYyGtnjANlbQ5cNFjhjTVtlbaBk9KW+51C/5JRRL8Ba9jkugCTTj8wq/N9+ZGSSiPJnEtvziZLT0aHw3NBLYsPcZCX0/NQSzTOolr1TpGOFvvndNEDXjy6tRfuUp0o0n6DM368y8I0vgbYe00Q0duVXkq4iH3Fh9Q40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EJmG/Hjr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EJmG/Hjr"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccdf36f63dso57075ad.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785453617; x=1786058417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8nq0/Hmm93fF2JW2THyDFZojbW5xmKXoinFZToOHmQ=;
        b=EJmG/Hjr+YdbZnwRfiRY1eYlZTOV2eeL3RN70Cfe37RhydlKsY4jDKXOu5lN2oG6IU
         bQ4k8Q6L9PNwpwpMlbXVd0lOkfgBCvkxJWGUy79dQDNRks8IqS2hnBPVpESe4wqDsU9E
         ovBfcHDSazjA/FoAfbUialeirbvZmMyKt/LE9TxLXX5FcrawobnODpL7zKyB3fOujiwf
         yCX5+KuwiDvjW0F2ZliHFDvPh0j8Zd4UZBFtw/wHztJzjMcDI59mvAZNTyWLcNBUq8R7
         dSF8qCRCKU4kvHQaew/7BUzKZ6bL6i5ZtMRahhx+M795j0pHgn4q330wbzJaJ8ewFNut
         R56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453617; x=1786058417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8nq0/Hmm93fF2JW2THyDFZojbW5xmKXoinFZToOHmQ=;
        b=AUOfiwNOyzTItPldmHfS9Oeuvj/bn0+MDbeIt6ATlJxA+w8m796PoWeH2Y5NWruLN/
         o7MWzLg9tHqHx9BDO5bqi1Zs1DwwSmOSN81+lokfNd2F0Ubs5Cu6gMs9QEwPxMPXpGmG
         9XOIWyzdQpUjWx9Ty3r8t7CzZvsQwJOM/7hblUOPUqHORLCkYQnnebxPh7BROsDl+dq+
         hcwW2jx1rEXOdN32JmgUjmUrNiAFr+nikSXEwnSppA8WaZ3QhzZG75AHpPyIhAAbCprz
         kY8+2RcngsBldcBcgk7BDbSEdJMcgcEWWwJP/LHW0ZyZXD3hKa+4cyXAdVOAeQJWtYzp
         01PQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHVXKtYfXSa6wGGTF77BrtG8Y0qaPhuNvJ6dPZ1ysftgJKNwBF64Z90aarOqJIFZy9Trh3XqK5ZDYUSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfdb/8Rjtuac+B0Pf/WgGz4Hu32TpO9A8xi9SXPJfrumdUXATr
	qIXtSvFeHcSwQ2wm2+cotqfrEtxFYWJy4NKP0pI+OhgZtZdjwptfjekCARqS9dsIDQ==
X-Gm-Gg: AR+sD12VqPM3YjKRjezqiIT38biKCBD7mHYB+GBjl6PCCq9ZsukDXlqmHcHZhKNjKqr
	A/pTJsTK3Pq/enTfPY95vJfWSDFgusf+u5U1LFfR9nxY2ouJmca1NJEyYr/RmJbgLK+cjvZnG1Y
	G8/LnCoay6E+kQSKaE0eTc4/sc/yydYGeIho6irDaiwqKuJoUhsEliyUoIUNIynJgUI10KWkiNV
	pHNuf6cJoKNGtk/efs8Cv5DQqck+bYSX1Vu6TvLcr8rnTRNFVfYpl59nB2u54gmNQ25mWAACx2M
	E1fwTZ7Qfbc1V8VQS94cXHKSUs6zALbw/nfPTzT8yiyeGSz+Tjewq9+p6R+kJyMQhI5NqODX0sV
	NMiKpxNLWloUJc/YLZIT0Vi5GFfU6ZfEleaP91ypJjU7Zfo8RdX7Usc/X5zLR6yzfr6Lt5XbC9J
	7S9dbEqohGjWySz4nIRRnIfxZhY7z1ATFMJNg6RJAIyNmbE5T6DDLwgtLmqcfjQjfbB/zHSX++/
	Hq5rrcIq7JfyLodZ1vorWI=
X-Received: by 2002:a17:903:2a88:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2d043c66fc3mr2363495ad.1.1785453616883;
        Thu, 30 Jul 2026 16:20:16 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm24706277c88.8.2026.07.30.16.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:20:16 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:20:08 +0000
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
Subject: Re: [PATCH v5 7/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <amvcKL8FR60OoTDW@google.com>
References: <20260715174737.15287-1-matt@ozlabs.org>
 <20260715174737.15287-8-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715174737.15287-8-matt@ozlabs.org>

On Wed, Jul 15, 2026 at 06:47:30PM +0100, Matt Evans wrote:
> Previously, vfio_pci_zap_bars() (and the wrapper
> vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
> calls to vfio_pci_dma_buf_move().
> 
> This commit replaces them with a unified new function,
> vfio_pci_revoke_bars() containing both the vfio_pci_dma_buf_move() and
> the unmap_mapping_range(), making it harder for callers to omit one.
> It adds a wrapper, vfio_pci_lock_revoke_bars(), which takes the write
> memory_lock before zapping, and adds a new vfio_pci_unrevoke_bars()
> for the re-enable path.
> 
> As of "vfio/pci: Convert BAR mmap() to use a DMABUF", the zap via
> unmap_mapping_range() is no longer performed for vfio-pci since the
> DMABUFs used for BAR mappings already zap PTEs when the
> vfio_pci_dma_buf_move() occurs.
> 
> However, it must be assumed that VFIO drivers which override the .mmap
> op could create mappings _not_ backed by DMABUFs.  So, the zap is
> still performed on revoke if .mmap is overridden, using a new
> zap_bars_on_revoke flag.  A driver can explicitly opt out; the flag is
> cleared by the hisi_acc_vfio_pci driver, since its .mmap just wraps
> vfio_pci_core_mmap() and so still uses DMABUFs.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks
Praan
