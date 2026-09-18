Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE31F16B
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750099; cv=none; b=qdDmRqpH0RFDQjXAB5pCUSRv2C3BbjoPsYsU23aRQ69k3tqClfU6exMVQnQvDFRVvpmPFDKUeINJ1fl3kfOG7MxCFElZocpoDd1T2zYL1cueRLovMljBClfAdHhg8Cez7unSK9qjgYY9p3rcRTR6ZQTyhLx0VoebILcJJBsX+gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750099; c=relaxed/simple;
	bh=71yKhRSwu86aAK58ECoNp2aeCOfSvEdWZkWGV753u+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nXXCg/b8/qZnxvV0wFP3/0q4x0taeXERzRerZM9gYpf/nEKvs5Qdd5lQiQIL1wOEpmIi5IIXe7WwU/qmp7NPypRaXnkXq73pufxZVGYpnpu1ZlVAsRf3wBp6JSMFGPRnt9QP8YuNnLKdeAuSkrsRjB3ejY4hXetavv/t6SZPNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=j-ernberg.se; spf=none smtp.mailfrom=j-ernberg.se; dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.b=reSgn/z5; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=j-ernberg.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.b="reSgn/z5"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so340347e87.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1789750091; x=1790354891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWZSke8R3MOGFS40eHPzTBXQTGfzdQ5bNS1FSTUd5c4=;
        b=reSgn/z5fJDPMTrQAgBFOyXaVZzY74MzMXiOkB66qtMR/3igxMLPK46059FgzLUwMN
         3HON6VNkzR6/TV8Gu0mFiqQMKAnm9/HD+CQ9dLgPiNzQSfhQy69gK0EYMHsggpaJFyK8
         gPERUiGahvofXBnZT5YF2zGXGkxNVqzCjZkqqcPOrO8G1sIvMFqB5viP5ZpUq5NiSfse
         Gt7TDWQ63Xol3SPwIhx7zYFPSmSaB5dHZbMfIN79wyuT9LQcWdArQnV4QduvsJl2Q6un
         RQrK31BGQGgHYeFMlIBkIrpb34ytEkLgSSKZes33lc+C3k/rgNke8sgwBurDlG242aCD
         Im5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750091; x=1790354891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWZSke8R3MOGFS40eHPzTBXQTGfzdQ5bNS1FSTUd5c4=;
        b=i38QjKTUX3LDVnMwsh4QE/14gGQsfgUkGGqLKrcQgFSMRVO4yQS84naTZfld8yhC7q
         IEjxuALbuOirtkDpniYusnchGGEfHTrhXLNWXNQTHhomQZB2TflaFnwvpIwS/qMBnvCg
         h6dxITwedvFiem3NA82oZkP1ilFZ5tteyWdCIbfv8RK69KtL+r/Y8nMP8tMT1vxN7yAs
         lbwoh7APVkK60lnWxX/rkR159ei0WUTcpDjsf2SfacOJNjsxijzkW/bEt3qe8z+PB1MY
         vKjg7HJ+1wt+hdQot5NrEF1i79pohEH+wRdRfnFTdqBKwQ5OP6VIwDZwVphBUh098Wa5
         izog==
X-Gm-Message-State: AFuF++k9yF59bWPmKfBa2SxtbGsZk2wS3oehiiEaI4Ud/8Znirwk1xcX
	A7BYFqfZg1YKxRwyacUcJ8sA1Uu0wk7LsZChp8ARuquVRTkqr0OAva4Kc0ooeYpzoBEyCoMen35
	NEebcISU=
X-Gm-Gg: AYBFou2GI8r35oMoBfUh6kLYmccTE0DgBGD5yqQeovJ+pB3ncy38Eqnng8pA7dK0qHc
	ArK9TJAT2movyO0JT89nQNOjcEXrA03rKhLEDvy0kRjrun8wg5lkY3dqBGNCBH9z0u2W5It31+T
	Nc7dnbO5HHGHVNERe/efqVjFbgh5mukqRjtRSmdm+mw//zNgOMziS/rBo5PNARLVW5vRT/NI4Q6
	4T5bmzu7+oF6msc2F00RwA9wrYuk/84F07hqHuvk2P+homi2i6TDji5H1H5x+PTKgou8XcciSwe
	mb3sk1UCuk2wyDW/ROXjHIvng1wsvu6zEusEky3sppigU9cHEVY9cKbcHp9rbdMePZS/GacGoBg
	jHXmWFyRYH3jmdFhfYom4PqMnKn6+SyMYoJrZok4FYyFF6CMaKqxRKzkM8kgfOMrETZsRtffbB5
	sBt+FYt9c8ug6e4SsGcuvM0Mny8LpfdOO5+lgZT3/VHUb/S1LV0Lx8W79Yahuo2HaHLYN5KWBzb
	i0IJl3TKDyb8a7yWJf0aiS3vH2ZnhPIZwcNJyfQeVwbBT5oCPPlQuEZG7I3wlG5zorsCJj7/Dcx
	oRzqIDLdgh7w
X-Received: by 2002:a05:6512:ad0:b0:5b7:6665:1028 with SMTP id 2adb3069b0e04-5b8c1446a04mr968185e87.9.1789750090706;
        Fri, 18 Sep 2026 09:48:10 -0700 (PDT)
Received: from localhost (78-68-185-168-no2360.tbcn.telia.com. [78.68.185.168])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-5b8c270eafesm594152e87.6.2026.09.18.09.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:48:09 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: linux-media@vger.kernel.org
Cc: John Ernberg <j@j-ernberg.se>
Subject: [PATCH v4l-utils] contrib: gconv: Don't clobber gconv-modules on install
Date: Fri, 18 Sep 2026 18:47:51 +0200
Message-ID: <20260918164751.3617371-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since glibc 2.34 the gconv-modules can be installed in a subdirectory
called gconv-modules.d to make it easier for 3rd party projects to add
their own definitions.

Keep the gconv-modules filename as is in the repository to keep the
structure self-documenting.

Signed-off-by: John Ernberg <j@j-ernberg.se>

---

glibc 2.34 was released in 2021
meson 0.46.0 (added rename directive in install_data()) was released in 2018

--- libv4l-1.28.1/contrib/gconv/meson.build.old	2026-05-03 21:06:00.999985109 +0200
+++ libv4l-1.28.1/contrib/gconv/meson.build	2026-05-03 21:08:56.235020477 +0200
@@ -41,4 +41,4 @@
 
 dep_en300_468_tab00 = declare_dependency(link_with : en300_468_tab00)
 
-install_data('gconv-modules', install_dir : gconv_install_dir)
+install_data('gconv-modules', install_dir : gconv_install_dir, rename : [ 'gconv-modules.d/v4l.conf' ])
