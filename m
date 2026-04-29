Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031B29E0F6;
	Wed, 29 Apr 2026 03:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777433836; cv=none; b=jP8VhqP0nLONezpkwF0xyzt01SeQ8dQ/Rld1DaWFoRKH56jb35gSJLAsp2vET8v6KCqaTT8NU6pjY2zKkDP6fhG+iV2WHYFcYslag/ZaruHpo2x6q/kxZG3d95RJmPot18qRWzhM6T34BcIQzhXzuXMl/cS5OinLEoyTDq+9vfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777433836; c=relaxed/simple;
	bh=08OmEsr1hCRDH/YORMa9v5Gjh7FzbFNCu850g0aXVR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t8jUgjh3q77w13K9OtgsBzD4sHV1LH6DBNOkX9lUWrJxIaaQMwtbPvQUzoudcVeWI+s3srncEMnHQVE7hvFjRFEnlS29V93uPHKUhxjfJEwF8e339n7p1+l/5xnfFbdFROCeJmI5hktHSNDNndP6tPRdzwUPdyo9OoKhTFPHwls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gkIskgtc; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gkIskgtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777433788;
	bh=T92eqt1ZCY3opLCeE0wWBQVRlnkO8R7C9G7IEAWn3qQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gkIskgtctul857COoT52WYzqZzVR+r8yQHIy8qCzU5g60c87C0NaIdPa8YbbgcJY8
	 YMOI5AudvDD5hkq7HioZjAIspDP/MDMzyp7zFrJzQqzZshq0SXTkRw6Isy8y/M0Y12
	 5hcmcD1HLlnH+zuptE3IYgrIxd8l+ukvPYMkZxiM=
X-QQ-mid: zesmtpip3t1777433780td3efc152
X-QQ-Originating-IP: OqaDPEAT1Wdwt0z7nXhNiZTObUmblkbnDqWfTxWVa5o=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 11:36:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15583585262135573335
EX-QQ-RecipientCnt: 13
From: Haowen Tu <tuhaowen@uniontech.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	pavel@kernel.org,
	lenb@kernel.org,
	oneukum@suse.com,
	kernel@uniontech.com
Subject: [RFC] USB/PM: should USB interface drivers distinguish hibernation THAW from RESTORE?
Date: Wed, 29 Apr 2026 11:36:17 +0800
Message-Id: <20260429033617.1954257-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M3vv73qU6a4uPXcIldRwK9B4UiSgdQBKdeFslIBdSbWPEUBpzKXLYxLF
	21s8R3cyHwacTVaXM5Jnf5sCb0X4eIVR7pgT+50uSEzvQkxKSAVE81aLqO0RUs6DR2ZWcox
	W29QLDWFRtJ5TVMIHohgnbGjoNA5g9z8XIbhrKBqp/GF0pf9+rCfFFcqmbhl5rKybU0IYIx
	DuZ5VP9i1rCJKfV5j9v3HFzdST4H8jFgum0GihVaSPCPIM/x8YPMr44vi7dGeSfznucXhbP
	ETCAH2TtPJS/iSM4SSPr3KHGKHRMRjVpmnXJRo8tLQi4x4JnGEW4hyDRL3WwwfYHV+QXwZ8
	Q9Csv9v6orA17T0AJXkJa7pdRHLLgUDk5PKATRBsQkGGOwOILFyYff3zTVTp5km7XNHzW9o
	wDUEJizHDv3x+LRibpbCePT3ZOCtUCQn3Ia1ln02/Sldv+qfAIYFL4ra0m6nauD1N2mQpjk
	FUmIAg+JbqAXHH0gW5DuFQnMFy/1dpMp/jPatEv/phgoUFPqW16B7aL6ZscN4e/Ook+1j3h
	m4iE7DxxGXlyWo+MHpC2tRTGQRg+5mdsuejJSLxgsb86ZlZYJ2h8g68hbkpoGycY45GkNJ8
	t7qTqUz0ZvcQQ/90opSmBMxQvFiC1lR9Q0CVWSy86RuwosgedR4mbjY7Tn7/609NAdEey+W
	x6YTD3wq+4KsX5X+ZrKXHSWNSpdU3rpRvdljSLUbmsysMGSMmAIBEdgBwIQwEEe6cMFxcnc
	UO4+Fy66kxtnxsPwvArmgsxlttQBd+nkf+xvLDkItTUeqqefuG/WAl7+cLO32qW6gVjkHDA
	oXVM0f1XRFp/cwaMqFmmmHuuI/9JoaR5hAy3E0+ayTfP/7EFQI5gqs1JghKmYpIRL7r0vPM
	JCWdfvGd0ORmuoLIDgpj5WAiIXSr23pHBnEle11ijJ7DfCBfYJstxsnsc5PtCGDisuST7yX
	cNBV/Csh6IeN7lsXdB47nn9q293he0yVuYQBSwj0KmKw5JTd818QD19ZCfVMdZm0RoqLNuv
	B5yNvLFFLgZRptVyzv
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Hi,

I'm looking for feedback on a USB/PM design question that came up while
investigating a UVC hibernation issue.

In the hibernation flow, after the memory snapshot has been created, the
kernel briefly resumes devices in order to write the image to storage.
On the successful hibernation path, the system is then powered off. For
a USB camera that was actively streaming before hibernation, this means
the USB resume path runs during that intermediate THAW phase, even
though the final RESTORE path has not happened yet.

From the driver's point of view, that THAW phase is not semantically the
same as the later RESTORE path after booting from the image.

The difficulty is that USB interface drivers currently get

    int (*suspend)(struct usb_interface *intf, pm_message_t message);

but resume-side callbacks are only

    int (*resume)(struct usb_interface *intf);
    int (*reset_resume)(struct usb_interface *intf);

so by the time a USB interface driver's resume path runs, it has no
direct way to distinguish a hibernation image-write THAW from the later
RESTORE path.

The immediate trigger here is UVC, where resuming the streaming path
during that THAW phase can turn the camera LED back on and cause other
visible device activity even though the system is about to power off.
More generally, review feedback on that patch was that solving this in
individual leaf drivers would not scale well if other USB interface
drivers ever need similar behavior.

So the question is whether USB interface drivers should be able to
distinguish these two phases, and if so, what the right interface would
be.

Possible directions could include:

  1. Exposing the phase distinction to USB interface drivers
  2. Handling it inside usbcore
  3. Adding a USB-specific callback or other mechanism for this
     transition

I'm intentionally not proposing a concrete API in this RFC yet. I'd
first like to understand whether this should be considered a real USB PM
interface issue, and if so, which direction would be the least
intrusive and most maintainable.

Thanks,
Haowen Tu
