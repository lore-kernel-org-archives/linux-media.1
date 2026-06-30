Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361142EEBC;
	Tue, 30 Jun 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831287; cv=none; b=F5JYpfn7FGTCleYSZR92dZvWAbSgu8tJBhzUvaEWTH/+yVwpcHTuBchrIemYZBs9dDku/JGThipO/4cp5Xu0nvXHYCD0RL+cIq3a0HZNIoLJ3Fcz53KvCyDUKSlUTi2AoEbqQdum8hoScl58I5SuYEv4T2J9O7lVf3v8EhmmdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831287; c=relaxed/simple;
	bh=31CobtgGDUskTMKMIeed5Y760SonZt5k5n1PT8zDtGU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VQbqwXv+zeIXlQvegkAv7O/6KKN/Co0JCiS8Wo7lpPNetSxKkp03mW8U2/yICAA3azarbtnGiS0p4xgB/u25GFNJl3yete4n2eJaem9qZGgjp6QVP+CBXYhYQJZAuOGfdpZo3UugDwd8+b4+e6O5nIxpZ6Atn0eSIPD/VeKLUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=VFHn8EGe; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="VFHn8EGe"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEHpO91232927;
	Tue, 30 Jun 2026 07:54:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=fBNK2rn7Y
	DHqv3zBBH9/xAyj4fay8+kR1znDxOPRjSg=; b=VFHn8EGeTyLKxvHCZREgCk2jC
	KQnIL3w3zC0PKLmaQG6K62loAMAA4Mi97pnAznu/Kdi1rBwJ4eLTZH3iolu/zjH4
	A3Q/+GfIHkOhcEn/UbaiQFHszCtpoUAM8LxC2i/KGPEKwBMk2RDyX+SfD5/wP9lh
	yJEjHGidD1XDFnJYSJiy2hv7cpF6EkceTbUDa1urdyPdi34tj+xE0tj5iGofRjIl
	uIM0OB5jiAfEgMLTcsD7iXR2d6JRWGPV5eGQQqvtqeOkvA4v+IwEqO9S1g0hBnHw
	iPB7DfrhuY/asU6rEH28zb+RLpjcoNWhiz8B1v6a3t6gcIh1BsjkGmIRulp4Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f2e1gus4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Jun 2026 07:54:37 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 30 Jun 2026 07:54:36 -0700
Received: from pek-lpd-ccm4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 30 Jun 2026 07:54:35 -0700
From: Jiangong.Han <jiangong.han@windriver.com>
To: <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiangong.han@windriver.com>
Subject: [PATCH] media: em28xx: fix use-after-free of dev_next->devlist on disconnect
Date: Tue, 30 Jun 2026 22:54:34 +0800
Message-ID: <20260630145434.695696-1-jiangong.han@windriver.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -WmzrRJBMBaafV3zUouwnKTO3-KehRLp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfXyec4rvXpLk7r
 waL4BfXVo4Ntub0GRvhDNX2JuizVKF2RPtQGwgh1DcSYmGfhuqthtagZlzeQR2IHIv1ctCBasjr
 /y+fEjNEOkqLR7alKLO8SRFeTn+xbHOmi1dyE6RYLrNGX83mSE39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfX3BN5I0vb10Rj
 r/4I1ekrsD3+wlrdcyQCj6VFt6z5q/kcKtaHrWBjFQyq/HuzW3W4v+edEx1fCZjIv8S4XD7WmIQ
 7GzxrwO3bj/cXFGVAG6/G3q21gRAYahTUMbeCSyT09F2ZiDXaL5AI8dcMXVHmE58QGcb96tSFBa
 lhv4Bwgi0mYITKIeBNnUwuwa0a0LsvtaGgEhZAnW62j1+Uq/1DYDAvvyoZ3SFw/MEgKLn0LlxLX
 +XIDBpLbqiyU8ImmsteJ/Q7D+3qskJxnE33wEypq5ki8JZ766v6F5OgrFT/Xpho5aWvWtqqHeC2
 20UabBLwOFaaEo/r6dFGB41BrlMlLOZZr/kN3ty6GmqsweCvUh3yGFUmVyS9V4yiZDY3pSxNuYb
 EK+dtOExR2WUHKlensC+YO4UO46FLhS0T01CyiUOx9zf7u6kSw0nYiuynOQoUnwn3FxbxvgvdzE
 NAnL0SGcRqq/KPu1UQA==
X-Proofpoint-GUID: -WmzrRJBMBaafV3zUouwnKTO3-KehRLp
X-Authority-Analysis: v=2.4 cv=GsByPE1C c=1 sm=1 tr=0 ts=6a43d8ad cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=edf1wS77AAAA:8 a=VwQbUJbxAAAA:8 a=hSkVLCK3AAAA:8
 a=t7CeM3EgAAAA:8 a=PL0YVfiCWiXKjdacPdcA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300139

When a device with has_dual_ts=1 is probed and the is_audio_only path
is taken, both dev and dev->dev_next are added to the global
em28xx_devlist via em28xx_init_extension(). However, during disconnect,
em28xx_close_extension(dev) only calls list_del(&dev->devlist), leaving
dev->dev_next->devlist still linked in the global list. When dev_next is
subsequently freed via kref_put(), its devlist entry becomes a dangling
pointer in em28xx_devlist. The next device probe that calls
em28xx_init_extension() triggers a list corruption BUG when list_add_tail
detects the freed node.

This bug was exposed by commit a368ecde8a50 ("USB: core: Fix duplicate
endpoint bug by clearing reserved bits in the descriptor") which clears
reserved bits in bEndpointAddress during endpoint parsing. This causes
fuzzed endpoint addresses like 0xf3 to be normalized to 0x83, which
em28xx interprets as a vendor audio endpoint, enabling the
is_audio_only + has_dual_ts code path that was previously unreachable
with such descriptors.

Fix this by removing dev->dev_next->devlist from the global list in
em28xx_close_extension() before the device is freed.

Fixes: f410b4093fdd ("media: em28xx: split up em28xx_dvb_init to reduce stack size")
Cc: stable@vger.kernel.org
Reported-by: syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
Signed-off-by: Jiangong.Han <jiangong.han@windriver.com>
---
 drivers/media/usb/em28xx/em28xx-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 5bbb082dbed9..3d6b196b8483 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1265,6 +1265,8 @@ void em28xx_close_extension(struct em28xx *dev)
 			ops->fini(dev);
 		}
 	}
+	if (dev->dev_next)
+		list_del(&dev->dev_next->devlist);
 	list_del(&dev->devlist);
 	mutex_unlock(&em28xx_devlist_mutex);
 }
-- 
2.37.3

