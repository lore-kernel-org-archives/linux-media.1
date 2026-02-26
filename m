Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7D137419F
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772071538; cv=none; b=cymLWVr7XkOcOFu7vZaGxr7ldvjZIB9J7/q34we0q7Pmcv7Ub93cb3GYJA8s1YN4KuFj0PgWEemRV0OnNIJan3WSxJUSp2ExuN+UPjhywxhkJVq7avAVa4YDdG5xhuft4pTFSwh46v22nLIkMBtUsf7zc6GYyI3zly9NnE9csug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772071538; c=relaxed/simple;
	bh=Vp3t0gzam4PNr9++u4d5WtUTbSBrBRpMXD8fgkXYTeM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8lejyc5nFVpm03fFv44iaB54tP2LH1CFgB8QdaxZOaMJh1y8lxx1/izRPqEJjhkla79jiBlhhn8B1Wh9sHsmf3tnFPVCSj9VkrV2gD7dyT1iNlQrUKsMExysYee9+tgGReTCj/WZKH6NHpmBVXEihyLrTnxIcbdrre8D6X8hLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=3IGkE4xz; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="3IGkE4xz"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1772071528;
	bh=GNhquZ9qPiFSd8zwLcfj8WutLntdZvl6BB/GwG30iog=; l=1122;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=3IGkE4xzVkN9XKYfLRP8TNGPkTPXUV5LGWgPAk9Xw5+mlNob91rOph/J0x+th5XuS
	 ihPdV7osV/Cfjhk0UoA0P+b9b3bKzxkozMoEEkVHV1b4xhufa2v0HtEGcWN53LqKmx
	 3AuBm6DF0sCmvxk8hcNXFxkLPV9jNDo9p+PjEOJBg99hU4b/+/tOR4ChGtOrZxdYOS
	 F7yLKG1AO3uW1tYzk+bq5HBcTe+fDZJaDIf1PzuRdgNKHxXgiNsks0AyhKcCpXhAVz
	 tzKjGWLHZN9qpJaar9Gy/uxAmmOfhwVgJCs/H8SzdGJTKH35dbQnCCnpUAFkjwydQf
	 BQg/ew4QwIXdA==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2285630:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 26 Feb 2026 10:05:26 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 26 Feb
 2026 10:05:26 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Thu, 26 Feb 2026 10:05:26 +0800
Date: Thu, 26 Feb 2026 10:05:26 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: <linux-media@vger.kernel.org>
Subject: Re: [v4] media: v4l2-flash: Enter LED off state after file handle
 closed
Message-ID: <aZ+qZnukiegJcqMh@git-send.richtek.com>
References: <699f2d9d.050a0220.20cc5b.fe9b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <699f2d9d.050a0220.20cc5b.fe9b@mx.google.com>

Hi,
On Wed, Feb 25, 2026 at 09:13:01AM -0800, Patchwork Integration wrote:
> Dear ChiYuan Huang:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/94019364/artifacts/report.htm .
>
After reviewing the report, status failed on 2 jobs.

Job 'static' -> could not see any error
Job 'virtme64' -> gitlab-runner stuck timeout

Is it trully failed or actually the false alarm?

BR,
ChiYuan.
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 
