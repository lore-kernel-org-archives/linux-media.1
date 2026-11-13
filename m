Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558466;
	b=CyLhQyXmY7EpTKPM0ayJxR2PPvzpv+LMEMKuNjMdaqSBKQQMy/mwLoSA6ZRucDpMAOBr
	 UE6Yxk0EDJHihCUnnXi4rzL0CGG2vSVzHEuEQwzZnEBDKIIJQPMn2eXUKdZEQKVW2Se7S
	 HNrhdXkmueK43n+gEhKG0FpylBiywjX19mtnNX/UTKiJ7s4ggdbDLhMs83UXAaaE5/220
	 cNshY9Dza46rTk4XtiT2n0s3TqnKIFA5mw6vqiUekoLCg4LQn9VkA5esxs+hPS3tm9obb
	 BBJaE5Wje51zNf76Rw8pnDDYI9Sg6dvGk4BcmLJXHb/hkL6IkssbB9DsGAjWJVwzz2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=KwXBgdSX1S6u4/zNJcPi3rUW8TKrnqfVUYwdT81GQ1Y=;
	b=ual4ArjQ/rbu6QSwIFFBFsrRuVZtfRko/iuJ8elH0HHYuF2vu1XAp95QqVtS11Cz9YMg
	 RMb4MJYdGYn2JY7RBycM8topV5N9l4AdofqHD8aVWcDkxaJY6j+FXBjz6NjkWJqa6gIcA
	 UL+65W2Rj33W5mZ7fFpklTfwgr1WaJKoCJfj2ypVRYaMnt17IvcouBn85+YgiT6V5T8GX
	 rqIQAYhy2RoQO515IiiDj77UuLpZozqX5uWKTM5+E6JYqnBTahs/sOtLRvVsHGBsSkaev
	 1e1RyyqiFgTQfl3m2dUtRgPHvMoiX2S33Iipik5/fjuGQF4kRteFuntOStrUsc04ttw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=jW1RovZI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86013606A338
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86013606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=jW1RovZI
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4jQr3Z27f0z49Px4;
	Fri, 13 Nov 2026 10:27:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1794558458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=KwXBgdSX1S6u4/zNJcPi3rUW8TKrnqfVUYwdT81GQ1Y=;
	b=jW1RovZILWG92st2KJPG4lezA07YfcUOn5OrVtO2BR5l3vo0+zhfcaSgmoHHuQyLwY+8GW
	rG+GKEe9NQZHW91iti2HdDHcdACTBFu1JywgpIaU+5d6wPIHZB6aJEWBw8s/fy9Zq9aVNg
	oJSFl3P1QAPZxuUZpD5eKhkO9RxUp2Y5PD4yoxH8olqZ6ZoKFxZQVN1t0JR9LEBv5RccoK
	3WFP4P3onx8nQjIadvw1WK8l2spBxBf9cY8fzH7DjJIXiYVN6hKC/BAA+xZMCEBDiRqIvs
	bUjJykMY5HOA5lYyWIHy236H8TycgcPLYgiaGocIirOMD7ltGN78mmt81jW5Yw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1794558458;
	b=sCT9c+pc32SmmIzLFS9rvtY/eigxgQnU3NMg//wB2Q4Ur1kf/g2FvUKPEaCjZI+qdetiMC
	5yJicwM1ExYpwyuhI7pjuTMuN6tFdXy1T7bCDQjCZD7VmC3oLgY/KwWsHb6SyHOFEyQH1H
	+hvma7a0OV74RAQ8S6u2vOuYBLonZ3q8nUv7UOPk0j3+Oihpaz+TPkCc3NQpqWZbbbDV6O
	LU9Kw/NHl6xnxjbsCXtSeyvsn224rq+mIuZvMUVGMaMD+2ooKz1/pZ5Vctf3PDFPqQ/ngM
	iY5WafX1V7GLYLpEM4V7Oj77gXvQir6j6XLS/a8WUrWon4JLnkL9mQ0DdE2R7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1794558458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=KwXBgdSX1S6u4/zNJcPi3rUW8TKrnqfVUYwdT81GQ1Y=;
	b=ciDgrXnlvGjWIhKCeAbVlmbhicwCnB/E60sd6fO7ubsjdJpQhtn99mmEEUVWabsJJD+OBV
	ZtH+hrCtm0GmzDq/ZmRT8sYI7DBSkY4XZh9WsOohWHNwtq2npdq07ctdjta/sdLBanybuy
	aMoeaEM10jZTyG4yFNh+9btE9QfmnJJd+Umwe/vtfZ5Oj83m5oeg8ApsVDQ4sKeChcGOd8
	utTzSVR4nL8/XhNdimqs9IxPsATqmY6zJLzu990Mj4pooejjDfceEmRION7LiKWU/TxEke
	atJ0Ej/kgmU1wg1XTHGPmDgzUnxwWOdB8Z14u/RMsrQzlBk/nBKXojcoJUvkFw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C3960634C51;
	Fri, 13 Nov 2026 10:27:37 +0200 (EET)
Date: Fri, 13 Nov 2026 10:27:37 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXES FOR 7.4] AMD ISP4 fixes
Message-ID: <avbJ-TiORMc_xUbt@valkosipuli.retiisi.eu>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Please pull.


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/sailus.git tags/fixes-7.4-signed-2.1

for you to fetch changes up to 9cb3ec8be3c1a321d4f454bee4d9165347243d0c:

  media: amd: isp4: return capture buffers with V4L2_FIELD_NONE (2026-11-13 10:26:39 +0200)

----------------------------------------------------------------
AMD ISP4 fixes
- AMD ISP4 functional and UAPI fixes

----------------------------------------------------------------
Caspar Adriani (1):
      media: amd: isp4: fix self-deadlock in isp4sd_start_stream() error path

Seifelden Abdelmonem (2):
      media: amd: isp4: hold buf_list_lock while sending buffers at stream start
      media: amd: isp4: return capture buffers with V4L2_FIELD_NONE

 drivers/media/platform/amd/isp4/isp4_subdev.c | 15 +++++++++++----
 drivers/media/platform/amd/isp4/isp4_video.c  | 10 ++++++----
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
Sakari Ailus
