Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38BD211A28
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070718; cv=none; b=XZ1bDFAgV0tq3B3nbDWplCs5sWchWg9xK6O5t7t6imr0LinuUA12dmkDcO69sQ/SR1h1Fj44OgEY1Cv6lPfhqvI6z2fg1vE8R8K0vuXfwldFzKCtctOzOsPReu1vZiIPtP0XsZ5a3gYbwF3XX44zmV4Ov1hHNaCF4c10ZbYghdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070718; c=relaxed/simple;
	bh=p27op+haW3zGk1CF7ketpM+1vvFeXuegxWWutqldb4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p+2jTXn5a3bhbxe+wm0TfCiGzlTqtar/L8DZg+xjS8oaDQI2ra26D5CuXRjDXeuF4DHS52j4jwm4WmOWv9SGhi+9809Fo9aGw45E6kfM/Df06oCq4FAzn69VQS+XPxoNZ7E3rmFQjo4sb5SBffCHMuGDOw3hucF3k4kmekpQbNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Re0OdKyn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Re0OdKyn"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1572854e87.3
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785070715; x=1785675515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MB+CBxO5bL8vKJJ25mBR0JH6bMG9Dr8jqfUVieeAeX4=;
        b=Re0OdKynqW2R1H6ONl5N7aq3MdrZr2+HhUhRGJPGwMVsReM663Wg6KcoC1n+FaLaks
         xxNCGQZX941E8UeVFIbvciT9uk9btEQblkpwZ3Pkszvyv4XT3hwPUQcgtxjnoTt0lAyW
         rXGPABpcR6mOF553XDiWLZ76u19xRvxejirieRa1KHZ/bvCQTCjVxnM1MPwbST/0VIjH
         cY+6JKfgJn/QSDrSBgo8FYxBxDUOYU12LrsUNObkNfXGDvQf5aus/SPLDJJDAONqJqpx
         H3G2auGQDtxeqhCQadktWtR74U/OxG8nnqaWX4xhOt7as7p1my5rI+GNsHDsana1WZSH
         lG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785070715; x=1785675515;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MB+CBxO5bL8vKJJ25mBR0JH6bMG9Dr8jqfUVieeAeX4=;
        b=cWulZQloXw5rbwILT7upTNSVlU5CzosdU9WmXIH5DHqK0meTtEWoAYclACknRmmhZn
         2M1NqaJ5MOc6HdzV+xbTz1zVQ7eD/T/uVBmQDESjQAm389zIUvNd4vLrrCRtKUc9AqrG
         krVGUZOvT/J8COOyyHcdkWGzkyoGXEmyZMXp3A+2mSDB23lPyzzGRQ4eaecZ7VkNv9YE
         +JwDW2xTjOko7j9Mo2tJUwFrRVeW8N+aTu83c8pIhbZHtU4fV9c+ClY0em/8kp/gsOeF
         jYgPMANrD+6DSB0O7m++2pC7qnReXBurnd+dqPM0olvkAWS180EpPttGblM3m1C8MLtb
         cYTw==
X-Gm-Message-State: AOJu0Yyhks3SzV85M3q2whRiiuRyrTb2Kal/I7QFi/dtB+i/luwBhhdf
	e8BSZXt+er4zDGpwseDDgMx4Zt/UpFMuLlWtXXPCMeZzJVEHDybdDfBlyvuipVBFZ4UelwSd
X-Gm-Gg: AR+sD10yfFVdOd0fsK4c2f5BD3MpieWoRLfMC0wd8tWSjxxAz9qd1RTvL3c+x12bRyX
	du9mDBN1p6i+F328XC2I5v5T0c9GLpB48uj6TUCHOD51dr6Gw+aBzH1zTH/QHgO5X5wA+lviLn1
	XynL/ndjr+JN6ISWOOVllAkcSfhjH398LViHCOmmERnhSsw0uGv83fxOXzu1zmDS/Bj0YVmViZL
	l95r0AyjRa5pbP/5AiKrzkLd/U+FwZYwZpO1VMdg/VZFJUisRpVZnONPuteABfT4VRQLyWnetE9
	Bvn4V6aT5tfjBChoDebxC2IzGDzT9KDunAf1XXzWyh8kuTCK6nC+KHWRRi+GQtngbd+GI2msEjs
	oPDv2WFeTvgmYosr4HQdzscZjp6xeULqbn4JDvBLdXcH1yvgOco7HMxpzG/Aa9J/oQdJmsRxTGJ
	NdWP0fbjPAE3pi/YLQsRxPvFLKeCH4Kc6PPicC6BpMIg==
X-Received: by 2002:a05:6512:2388:b0:5b0:c95:cdb9 with SMTP id 2adb3069b0e04-5b2c1b09f46mr887685e87.23.1785070714647;
        Sun, 26 Jul 2026 05:58:34 -0700 (PDT)
Received: from archlinux ([85.93.1.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be08c619sm889583e87.34.2026.07.26.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 05:58:34 -0700 (PDT)
From: Mihail Antsev <mihail.antcev@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jingjing Xiong <jingjing.xiong@intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: ov02e10: wrong Bayer CFA order when H/V flips are enabled
Date: Sun, 26 Jul 2026 14:58:32 +0200
Message-ID: <20260726125832.12476-1-mihail.antcev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On a Samsung Galaxy Book5 Pro 360 (IPU7 + OV02E10, ACPI HID OVTI02E1),
enabling both flips — the orientation this laptop needs, since the
camera module is mounted upside-down [1] — produces a green-tinted
image with a checkerboard artifact, i.e. debayering with a wrong CFA
order.

Measurements on this hardware (raw Bayer phase analysis of ISYS
captures):

  - unflipped readout:      GRBG
  - hflip + vflip readout:  RGGB

Note RGGB is not the GBRG one would expect from a purely geometric
180 degree transform of GRBG, so it looks like the sensor readout
window start is not adjusted when flips are applied, shifting the
Bayer phase in one dimension only.

In addition the driver always enumerates/reports
MEDIA_BUS_FMT_SGRBG10_1X10 regardless of the flip controls (even
though they are flagged V4L2_CTRL_FLAG_MODIFY_LAYOUT). libcamera
derives flipped Bayer orders geometrically from the enumerated code,
so with flips enabled the sensor-reported format contradicts
libcamera's expectation and the pipeline fails to start (EPIPE).

Could the readout window be realigned on flip (datasheet knowledge
needed) so the CFA transforms geometrically, with the driver
reporting flip-dependent mbus codes like other OmniVision sensor
drivers do?

I'm happy to test patches on this hardware.

[1] https://lore.kernel.org/linux-media/20260726125448.11723-1-mihail.antcev@gmail.com/

Regards,
Mihail Antsev
