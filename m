Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F4B48033C;
	Tue, 19 May 2026 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190711; cv=none; b=pCq0k24wFptOqEPNJDvEgfYrOtZYAeKrUBITeOxmPwVQ3djppLgXj/pf7R/0dUSeYOH8np4zVDaQ/Ug9Zo34APnFSyOWDr/Rxub9rbCIvyrsKD5WTvprmu4NZi159eFMB/NHP9s+nAldJSNJ88rehbG6OommdznGBvYlTH3S42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190711; c=relaxed/simple;
	bh=Ldqt2evZpICTczUXVRvtMMUJkyF1TiVte9LKC1slNqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0FxsRaPBYPQG+XahoayAtoJvPHV8ylMHXtMN1I3SoitVN2sOL+KMXJ0MjCUfW/Dmd6Lkmha488qQFtscdKUtLo5NS2hUAImhSX83yiFBW+VpOxg0rX9MgfFKn6+fh9lAfhafyOn7MPaQICVlsQkfrJtNi+NMIRsDVyImGWJagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tm3aHWiH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tm3aHWiH"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E28F558;
	Tue, 19 May 2026 13:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779190693;
	bh=Ldqt2evZpICTczUXVRvtMMUJkyF1TiVte9LKC1slNqY=;
	h=From:To:Cc:Subject:Date:From;
	b=tm3aHWiHl4Z6Jlmnae4PnkraK95fhgvaH9ewKvsmBEKk2sUPn6jQqMFiR+wCBN7k9
	 764ChDBpFkzZRSWxIoVTdVpp9F3vBvyOX5PtYqkLw4kSg73vZ39xIWTst1WFTxGq5a
	 5L271GTl1md7OuMN4fP+gXlpyeH4H6bUehAu7RrY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robby Cai <robby.cai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example endpoint label typo
Date: Tue, 19 May 2026 13:38:23 +0200
Message-ID: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robby Cai <robby.cai@nxp.com>

The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out}
endpoint labels, which is confusing for an i.MX8MQ binding. The labels
could be removed as they are not functionally required in the example,
but they have a documentation purpose that brings value to the reader.
Rename them mipi_csi_{in,out} to avoid the confusion.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Drop imx8mpq_ prefix from label name
- Update commit message
- Drop Fixes: tag
---
 .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 4fcfc4fd3565..9eee67ed2685 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -220,7 +220,7 @@ examples:
             port@0 {
                 reg = <0>;
 
-                imx8mm_mipi_csi_in: endpoint {
+                mipi_csi_in: endpoint {
                     remote-endpoint = <&imx477_out>;
                     data-lanes = <1 2 3 4>;
                 };
@@ -229,7 +229,7 @@ examples:
             port@1 {
                 reg = <1>;
 
-                imx8mm_mipi_csi_out: endpoint {
+                mipi_csi_out: endpoint {
                     remote-endpoint = <&csi_in>;
                 };
             };

base-commit: d97d13c24d7893abcfb80d38630ce74daaa1434c
-- 
Regards,

Laurent Pinchart

