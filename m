Received: from mail-m93248.xmail.ntesmail.com (mail-m93248.xmail.ntesmail.com [103.126.93.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3DE3C3798;
	Mon,  8 Jun 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927550; cv=none; b=CYZTukv2lC1O0pkeMiftuKL0pfVrxx9w9IleGURDEPW4hfvpbb4F1LP7m6UQYuQez9+GnVJQNMPHerQSer78EmnGVxepZWlfv6ge6x2LID7v+exiwQNbS/ZpWGvPOKOtMDkh+xcDAzzCP6sED/FjI+ialKLqSBmBTQq0LwN4EEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927550; c=relaxed/simple;
	bh=j7XbVsDgIrZJQKAukPtnQ9tKrn8RPWGeRFOLIqQ201A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HdJbb6d+/WLW3HAQi1a6pMNmQa1BTjM1zEm9BKc1bg5IKI4ifwaXuj1Ht6la5v61jISV+UzQMhj3wGb8LVMvzgdeUUfJYWoBZGCylMnxTprUSOUpVHn06mL/Eo81nKJNkFJCXRR5Vwov8+10kFZ24TKurJdrKYa1aERdASidbDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=nkZ9vGae; arc=none smtp.client-ip=103.126.93.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="nkZ9vGae"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 41880eb98;
	Mon, 8 Jun 2026 22:05:39 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: error27@gmail.com
Cc: abdelrahmanfekry375@gmail.com,
	andy@kernel.org,
	dawei.feng@seu.edu.cn,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: Fix resource leak in atomisp_pci_probe()
Date: Mon,  8 Jun 2026 22:05:40 +0800
Message-Id: <20260608140540.3421356-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aiaCoV1DQKBx4ph6@stanley.mountain>
References: <aiaCoV1DQKBx4ph6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea78da8dd03a2kunmefd9f784f5cbe
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSRhOVkIaSxoaQk0eQ0tLSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=nkZ9vGae4v9MCJyiqGJ12XxQ2ZdTSalZ5Ic3EBfWYCCKhRcYbAGsJ+kdqHofEe1L6rm7oYjy3brO0swSrMxzbYj4HgeF49Krsy39ehpShzvq5oUMMoMl2zV0+pQuJsPYoaWAsCWxY6NDDkIov5JfL6G/WXeGRZhxmHJSf1/1MZw=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Z3g2cl3TMpovuwvwFtB/vkeHmGjMWbYYVXHcg9LD9WE=;
	h=date:mime-version:subject:message-id:from;

Hi Dan,

On Mon, Jun 08, 2026 at 11:51:45 +0300, Dan Carpenter wrote:
> The code is buggy, but this isn't the right fix.
> 
> Here is generally the standard way to do error handling.
> https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/
> 
> 1. An allocation should clean up it's own partial allocations.  That
> should not be handled in the caller.  2.  Every allocation function should
> have a mirror cleanup function.
> 
> The atomisp_uninitialize_modules() function is just a dummy and was never
> actually implemented.  The correct thing is to implement it.

Thanks for the review and the link to the error handling guidelines. 

Thanks for the pointer. I'll update it in v2.

Thanks,
Dawei
