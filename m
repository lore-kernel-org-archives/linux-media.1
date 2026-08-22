Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5193803F7
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787397788; cv=none; b=tGIP92HTMSp8lHyO/2r2OPsfweVSniMobDsyqJ69IyDhLuV5lFm82FRRSrg30WA9mfYMF/Gs7zfhcHhMn9KYS+O+NZ1R8Ymt26U/AdmiGow3WN4vYK4n/AVMxw0PzOjFvNhtMFfYr39GVt4BtL6+mWBppdtebMKxEh6Gw7W1+6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787397788; c=relaxed/simple;
	bh=grxIq2GALNody6ADldH3f4NTn19FLgvS4ie78H73heI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1weaRB56eO5joevQ1ymyZ2Fzcu8tDTbCfcMSLLL+BqWs732pXi7Yz9Nqr5x1uO9kdeb4C6sgyPRAmZznhI1yV5aXrqopgg6dgveZW96dj8xn7uFFBFrADYn6bwhDoyrvQYw4JqOKMev+kNVGcJ6ebmnyfPR79o39ClvbRKGtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tobf+0C4; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tobf+0C4"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so2511784a12.1
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787397785; x=1788002585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UZ9KRT6z8MHYQAiJ0+0SFhYkIAoxgeKdUrlJwQCpBQ=;
        b=Tobf+0C4m9CrGszh8BY6jkjLp8Gimcv0zjnVfMF3bdZAp2TsH5ruP2UipbXj2uul3N
         IfUodEGC1z35p4Xol/RjJyCxkA7mPWOz+o0Jc1LjQp2l/Q8k3v7cdg8WGbFbjKToQIHM
         4h7/49T1q71RJ/MYnvmVb5KoFgGzMLsg3u8yTmIXxWnoLgjMzIcGCRxzqpLtzdntmnKu
         8KOfuqrdnzj/pYK0Dq35uljZecaIfcARHt4poHsYkcFfvgUoIA2FY00BMReJ/SqSZ/LG
         7W8GVI2iy3K4AGZX6Fpzvh5qLpJ7Z5iksUiyL1BNRL3BFlhq0Nv6i9M4ax0DVPHZynFy
         kdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787397785; x=1788002585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UZ9KRT6z8MHYQAiJ0+0SFhYkIAoxgeKdUrlJwQCpBQ=;
        b=Yuw0O/1nDLW/e1AO1zf5iG+AfBi9b4KePaSBO2okof+h6eRz5OnWlI6DYgFwyTfO0s
         KpFAonHDldr1Cf72ERMENEbWrqDLIo4opZ00UcNMU6Dmvyxhj6RRbCTDhrVrQVq47Kab
         yV0D8msqP9+kn74JJDBMd3Gb2KFe5L3zCmNB1AdFfo7LAiqxvh5JV/7xmkVFiXlTUFHt
         7HrebjFCexU1Z53H7aHntzFkalImAqFMAXl9eeJ8XBCRDdBlwrp55wwjARRsf+ZoWwJk
         G3dd4SsBSmL6msR4oKWCxXUXp2DTN6QXvXint3pfugbfhteagCNxm72JwU2SfVlUl8Yz
         6BdA==
X-Gm-Message-State: AFuF++nXVrH8td6y3gEPq4ch0+gczuUcLlJVTG97j9S+wOMKtVRV7Dkx
	NrwFQCAlSXsCLiMAAbkhCPDzx4RDzP1a1wJ3OV+h9XbIRBk+cc60d9WyYmbvR0ceq1Cxig==
X-Gm-Gg: AR+sD13/Jr5ZxsIaP287Pm1z7fJwJRu0qapubYCkqyA2JHb4ZM9CnjjSEBviK4uMGIs
	Pq4e/Hwjwo4gzlmsbuvmkLXaVXS65qoVQTG4HlPxKs3Oh8ICSmCqxwbJUdMvpZMqLpnUKbC186T
	MHCrufoLEej+Iyf1sYxsG/pOAVkON1bE+0grpFUi4xUI3HdnZ3sRFfjzNg+eqnx/FSD7nXdRzqr
	Z3EjZfITPvmeohMumjWBeJhE5/BWpq0NuqAt1iLxrw3TLM31odp/fuWqQmD60yiqqgisdIpcSz/
	wOsisS5tdH5XpstaE+q7cJdLQtHN5cBbKB8HOK8DeLzLyYURLGer2N0AUwNSVcFNBoj7jzGP9Ju
	erfTBcXXigTGiwkgf6P2J53macGR97CU+9aqSkyCmNzZ+G89wFY09viOt7FsGVQ4HK5MiqjlNzB
	ovYEHCtH2s/pEIxhl7Xl8ngZ+TOzk9wddmtmgS/Mm+8/JzuDQWW/kpRkMIRuk3GNPU6vE2+5DQH
	/4RSlOyyHyzVwtlxxd6R5BODOOkfVvECwZ0IMz27byaB3VimN/mPYa+A81gmW8YlH6ZvUoNNiao
	9C/NGwoY9yFNTKLsz+o3WJpuifxM4ZLbvzfGUkKoCHTXoWPuV0EeK1GSZeH1eapujHx8qiNdM39
	9WbLBExc8O0s1gGMiy7dLSM0xA/jzNOmtcO+MS85reg==
X-Received: by 2002:a17:907:c20:b0:c15:f4bb:e663 with SMTP id a640c23a62f3a-c246a3ab3dfmr1375089466b.10.1787397785227;
        Sat, 22 Aug 2026 04:23:05 -0700 (PDT)
Received: from localhost.localdomain (host-213-45-168-79.retail.telecomitalia.it. [213.45.168.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b4f1sm249568466b.3.2026.08.22.04.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 04:23:04 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: Nicola Fiorillo <nicfio@gmail.com>,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Two oopses and a hang when unbinding a streaming sensor
Date: Sat, 22 Aug 2026 13:22:54 +0200
Message-ID: <20260822112258.7727-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812105305.32447-1-nicfio@gmail.com>
References: <20260812105305.32447-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this series, posted ten days ago:

  https://lore.kernel.org/linux-media/20260812105305.32447-1-nicfio@gmail.com/

None of the three files it touches changed between v7.2-rc7 and v7.2, so it
still applies unchanged.

I am aware the merge window is open and that this is not the quietest
moment, so there is no hurry. If anything should be changed, or if it would
help to have the reproducer script on the list, I am happy to do either.

Thanks,
Nicola
